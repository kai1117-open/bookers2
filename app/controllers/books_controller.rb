class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
def create
  @book = current_user.books.build(book_params)  # current_userとBookを関連付け
  if @book.save
    redirect_to book_path(@book)
  else
    session[:book_params] = { title: @book.title, body: @book.body }  # 入力内容をセッションに保存
    flash[:alert] = "投稿に失敗しました。"
    @books = Book.all
    render :index  # 投稿一覧ページへリダイレクト
  end
end

  def index
    @book = Book.new
    @books = Book.all  # @booksを初期化
  end



  private

   def book_params
     params.require(:book).permit(:title, :body)
   end
end