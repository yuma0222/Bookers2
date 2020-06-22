class UsersController < ApplicationController
   before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  #before_action :ensure_correct_user, {only: [:edit, :update]}
  protect_from_forgery



  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def index
    @user = User.all
    @user = User.find(session[:user_id])
  end

  def new
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
       flash[:notice] = "Successfully"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  # def ensure_correct_user
  #   if @current_user.id != params[:id].to_i
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/books/index")
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction, :profile_image)
  end
end
