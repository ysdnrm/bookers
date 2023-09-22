class BooksController < ApplicationController



  def index
    @book = Book.new
    @books = Book.all

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update

     @book = Book.find(params[:id])

     # 更新内容（book_params）が入っているのが@book
     # バリデーションの実装は流れが大事
     if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book.id)
     else
      # createとは違い、変数の再定義はいらない
      render :edit
     end


  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def update_params
    params.require(:book).permit(:title, :body)
  end
end
