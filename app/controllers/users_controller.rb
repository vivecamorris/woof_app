class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(me_params)
  end

  def edit
  	@user = User.find_or_create_by_netid( session[:cas_user] )
  end

  def update
  	if @me.update_attributes(me_params)
  		redirect_to @me
  	else
  		render 'edit'
  	end
  end

  def show
  end

  def index
    @users = User.where(nil)
    filtering_params(params).each do |key, value|
    @users = @users.public_send(key, value) if value.present?
    end
  end


  private

  	def me_params
  		params.require(:user).permit(:name, :netid, :college, :year, :email, 
  									 :location, :description, :availabletime, :type_user)
  	end
    # A list of the param names that can be used for filtering the Product list

    def filtering_params(params)
      params.slice(:location, :availabletime, :type_user)
    end

end