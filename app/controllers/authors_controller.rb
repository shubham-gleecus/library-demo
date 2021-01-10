class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id)
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to author_path(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:success] = 'Author is deleted successfully'
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth)
  end
end
