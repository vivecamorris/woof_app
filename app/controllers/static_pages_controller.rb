class StaticPagesController < ApplicationController

	def skip_login? 
	  true 
	end

  def home
  end

  def about
  end

  def contact
  end

  def logout
    reset_session
  end

  
def signedin?
	if session[:cas_user].exists? 
		return true
	else
		return false
	end
end

end
