class MembersController < ApplicationController
  def login
  end
  
  def authenticate
    user = Member.where("hp_member_unique_ID = ?", params[:member_id]).first 
    
    #authenticate = false 
    
    if user && (params[:user_social])[-4,4] == user.hp_last_4_ssn
      cookies.permanent[:auth_token] = params[:member_id]
      redirect_to '/facilities/map'
    else
      flash[:error] = "Invalid memberid of social"
      render 'members/login' 
    end
    
    # srt = "Texstskjfsojfskofds1022"    
    #render :json => user
  end
end
