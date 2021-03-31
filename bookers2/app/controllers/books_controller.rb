class BooksController < ApplicationController

  def index
      @book = Book.new
     @books = Book.joins(:user).all
  end

  def show
    #@user = User.find_by(params[:user_id])
    @book = Book.joins(:user).find(params[:id])


    #@user = User.find(params[:id])
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
    params.require(:book).permit(:title, :body, :user_id)
  end

end
