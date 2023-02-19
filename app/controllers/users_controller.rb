class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    unless current_user == @user
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "アカウントを作成しました" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "ユーザー情報を変更しました" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :image, :image_cache,
                                    :password_confirmation)
    end
end
