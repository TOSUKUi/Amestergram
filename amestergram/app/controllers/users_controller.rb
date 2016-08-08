class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]


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

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # 更新に成功したときの処理
      flash[:success] = "Succeed to update!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

     # ログイン済みユーザーかどうか確認
    def logged_in_user
     unless view_context.logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
     end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless view_context.current_user?(@user)
    end

end
