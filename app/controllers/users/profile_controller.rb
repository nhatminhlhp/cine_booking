class Users::ProfileController < Authorizations::BaseController
  def show
    current_user
  end

  def edit
    
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Update success"
      render "show"
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit :first_name, :last_name, :email ,:password, :password_confirmation
  end
end