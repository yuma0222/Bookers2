class BooksController < ApplicationController
    protect_from_forgery

    def hello
        @book = Book.new
        @books = Book.all
        @users = User.all
        @user = current_user
    end

    def like
        @book = Book.new
        @books = Book.all
        @users = User.all
        #@user = User.find_by(id: @user_id)
        @user = current_user
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "Successfully"
            redirect_to books_path
        else
            render :index
        end
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
        #@book = Book.finf_by(id: params{:id})
        #@book = Book.find(params[:id])
    end

    def show
       @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        flash[:notice] = "Successfully"
        redirect_to user_path(@user.id)
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Successfully"
        redirect_to books_path
    end

    private

    def book_params
      params.require(:book).permit(:title, :body, :image, :introduction, :user_id, :profile_image)
  end
end