class UsersController < ApplicationController
  def index
  	@user = current_user
  end
  def show
  	@user = User.find_by_username(params[:id])
  end
  def follow
  @user = User.find(params[:id])

  if current_user
    if current_user == @user
      flash[:notice] = "You cannot follow yourself."
      #redirect_to users_path
    else
      current_user.follow(@user)
      #RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
      flash[:notice] = "You are now following the user."
    end
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.monniker}.".html_safe
  end

end

def unfollow
  @user = User.find(params[:id])

  if current_user
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following #{@user.monniker}."
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.monniker}.".html_safe
  end
end
end