class UsersController < Devise::RegistrationsController

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to @user
  end

  private 
  
  def sign_up_params
    params.require(:user).permit(:name, :dob, :gender, :email, :password, :password_confirmation, :avatar)
  end
end
