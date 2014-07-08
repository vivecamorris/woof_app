class UsersController < ApplicationController
  def new
    # user comes from before filter
  end

  def create
    @user = User.new(me_params)
  end

  def edit
  	@user = User.find_or_create_by_netid( session[:cas_user] )
  end

  def update
  if  @user.update_attributes(me_params)

      @places = Place.where(:id => params[:place_set])
      @user.places.destroy_all  
      @user.places << @places 

      @weekdays = Weekday.where(:id => params[:weekday_set])
      @user.weekdays.destroy_all  
      @user.weekdays << @weekdays 

      @openings = Opening.where(:id => params[:opening_set])
      @user.openings.destroy_all  
      @user.openings << @openings 

  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def show
  end

  def logout
    reset_session
    # binding.pry
    # redirect_to 'https://secure.its.yale.edu/cas/logout'
  end

  # def index
  #   @users = User.where(nil)
  #   filtering_params(params).each do |key, value|
  #   @users = @users.public_send(key, value) if value.present?
  #   end
  # end

  def index
    # @places = Place.where(:id => params[:place_set])
    @users = User.where(nil) # creates an anonymous scope
    @users = @users.typeofuser(params[:type_user]) if params[:type_user].present?
    @users = @users. if params[:place].present?
    # @users = @users.place(params[:place_set]) if params[:place].present?
  end

  private

  	def me_params
  		params.require(:user).permit(:name, :netid, :college, :year, :email, 
  									  :description, :places, :weekdays, :openings, :type_user)
  	end
    # A list of the param names that can be used for filtering the Product list

    # def filtering_params(params)
    #   params.slice(:place, :type_user)
    # end

end