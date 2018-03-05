class BooksController < ApplicationController
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)

     if book.save
       redirect_to books_url
     else
       flash.now[:errors] = book.errors.full_messages
       render :new
     end
  end

  def destroy
    books = Books.find_by(id: params[:id])

    if books.destroy
      books.destroy
      redirect_to books_url
    else
      render json: "Can't destroy books."
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
