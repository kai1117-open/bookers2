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



def show

  @book = Book.find(params[:id])
  @book_detail = Book.new
end


def edit
  @book = Book.find(params[:id])
end

def update
    @book = Book.find(params[:id]) # 更新する本を再度取得

    if @book.update(book_params)
      flash[:success] = "Book successfully updated."
      redirect_to @book # 編集した本の詳細ページにリダイレクト
    else
      flash[:error] = "Error updating the book."
      render :edit # 編集画面に戻る
    end
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path 
end

  private

   def book_params
     params.require(:book).permit(:title, :body)
   end
end