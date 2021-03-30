class BooksController < ApplicationController

  def index
      @book = Book.new
     @books = Book.all


  end

  def show
     #book = Book.joins("LEFT OUTER JOIN users ON books.user_id = users.id ")
    @book = Book.find(params[:id])
    #@user = User.find_by(id: params[:Book.user_id])

    @user = User.find(params[:user_id])
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
