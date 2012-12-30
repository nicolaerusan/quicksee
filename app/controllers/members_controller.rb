class MembersController < ApplicationController
  def login
    @body_id = 'home_index'
  end
  
  def authenticate
    @body_id = 'home_index'

    # TODO this is a mock authentication, and should be replaced
    # once there is real user data, and a way to verify.
    
    user = Member.where(:hp_member_unique_ID => params[:member_id]).first 
    
    #authenticate = false 
    
    if user && (params[:user_social])[-4,4] == user.hp_last_4_ssn

      session[:user_id] = user.id
      redirect_to '/facilities/map'
    else
      flash[:error] = "Invalid memberid of social"
      render 'members/login' 
    end
    
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/login  ', :notice => "Logged out!"
  end
end
