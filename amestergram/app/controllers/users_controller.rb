class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      view_context.log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
