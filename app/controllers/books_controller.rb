class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
      #@books=Book.all
      #@book=Book.new
      @user = current_user
      #render :index
    else
      flash[:notice]="failed"
      @user = current_user
      @books=Book.all
      render :index
      #redirect_to=>view=>controller(action)=>view 変数を定義し直す
      #render=>view action内の変数を使用
      #@bookに新しい本を定義した後なので、redirect_toではなくrender
    end
  end

  def index
    @books=Book.all
    @book=Book.new
    @user = current_user
  end

  def show
    @book=Book.new
    @books=Book.find(params[:id])
    #@book_form=Book.new
    @user = current_user
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @user = current_user
    #@book.user_id=current_user.id
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :profile_image, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
