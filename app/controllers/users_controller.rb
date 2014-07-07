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
    @users = User.all
  end


  private

  	def me_params
  		params.require(:user).permit(:name, :netid, :college, :year, :email, 
  									 :location, :description, :availabletime)
  	end
end