class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
def create
  @book = current_user.books.build(book_params)  # current_userとBookを関連付け
  if @book.save
    flash[:notice] = "Book successfully created."
    redirect_to book_path(@book)
  else
    session[:book_params] = { title: @book.title, body: @book.body }  # 入力内容をセッションに保存
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
  unless @book.user_id == current_user.id
    flash[:notice] = "ID does not match."
    redirect_to books_path
  end
end

def update
    @book = Book.find(params[:id]) # 更新する本を再度取得

    if @book.update(book_params)
      flash[:notice] = "Book successfully updated."
      redirect_to @book # 編集した本の詳細ページにリダイレクト
    else
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