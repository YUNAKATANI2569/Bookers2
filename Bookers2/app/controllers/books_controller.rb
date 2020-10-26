class BooksController < ApplicationController

 before_action :authenticate_user!

  def top

  end


  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end

  def show
     @book = Book.find(params[:id])
     @user = @book.user

  end

  def create
    @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
     redirect_to book_path(@book), notice: "Book was successfully created."
     else

        @books = Book.all
      render action: :index#書き込み失敗

     end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end




  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books = Book.all
      render action: :edit#書き込み失敗
    end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end


  private
  def book_params
      params.require(:book).permit(:title, :body)
  end

end
