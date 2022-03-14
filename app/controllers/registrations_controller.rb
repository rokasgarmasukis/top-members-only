class RegistrationsController < Devise::RegistrationsController
  def new 
    @user = User.new
  end


  def create
    @user = User.new(sign_up_params)

    if @user.save 
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      flash[:alert] = "Please check your input"
      render :new, status: :unprocessable_entity
    end
  end



  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end
