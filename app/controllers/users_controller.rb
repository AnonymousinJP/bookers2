class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  #def create
  #  @user=User.new(user)
  #  if @user.save
  #end

  def index
    @users=User.all

    @user = current_user
    #User.find(params[:id])ではurlから情報を取得するためindexページではidを見つけられない。

    @book=Book.new
    @book.user_id=current_user.id
    @book.save
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    #controller名?
    @book=Book.new
    @book.user_id=current_user.id
    @book.save
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path
    else
      if @user.update(user_params)
        flash[:notice]="You have updated user successfully."
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end
