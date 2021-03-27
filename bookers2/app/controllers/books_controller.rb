class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id #ストロングパラメータには、titleとbodyしか指定していない。そのため、この行がないとデータをどこへコミットすればいいか分からず、最終的にデータはどこにも格納されないでリダイレクトされる。
    if book.save
      flash[:notice] = "successfully!"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "error / can't be blank"
      redirect_to books_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
