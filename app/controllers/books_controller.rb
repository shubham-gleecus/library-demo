class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to author_path(@book.author_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to author_path(params[:author_id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = 'Book is deleted successfully'
    redirect_to author_path(@book.author_id)
  end

  private

  def book_params
    params.require(:book).permit(:book_title).merge(author_id: params[:author_id])
  end
end
