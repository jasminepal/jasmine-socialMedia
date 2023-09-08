class UsersController < Devise::RegistrationsController

  private 
  
  def sign_up_params
    params.require(:user).permit(:name, :dob, :gender, :email, :password, :password_confirmation, :avatar)
  end
end
