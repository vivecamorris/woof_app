class UsersController < ApplicationController
  def new
    # user comes from before filter
  end


def signedin?
  if session[:cas_user].exists? 
    return true
  else
    return false
  end
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


  def index
    @users = User.where(nil) # creates an anonymous scope
    @users = @users.typeofuser(params[:type_user]) if params[:type_user].present?
    # placeinput = Place.where(name: params[:place]).first
    # @users = placeinput.users if params[:place].present?
    @users = @users.placeofuser(params[:placeinput]) if params[:placeinput].present?    
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