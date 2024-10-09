class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
def create
  @book = Book.new
  if @book.save
    redirect_to book_path(@book)
  else
    session[:book_params] = { title: @book.title, body: @book.body }  # 入力内容をセッションに保存
    flash[:alert] = "投稿に失敗しました。"
    redirect_to books_path  # 投稿一覧ページへリダイレクト
  end
end

def index
  @books = Book.all
end



  private

   def book_params
     params.require(:book).permit(:title, :body)
   end
end