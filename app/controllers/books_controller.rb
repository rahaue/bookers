class BooksController < ApplicationController
    
    def index
        @books = Book.all
        @user = User.find(current_user.id)
        @book = Book.new
    end
    
    def show
        @book = Book.new
        @book_detail = Book.find(params[:id])
        @user = User.find(@book_detail.user_id)
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@book.id)
        else
            @user = User.find_by(id: current_user.id)
            @books = Book.all
            @book = Book.new
            redirect_to books_path
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
    def edit
        @book = Book.find(params[:id])
        if current_user.id != @book.user_id
            redirect_to books_path
        end
    end
    
    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(book.id)
        else
            @book = book
            render :edit
        end
    end
    
    private
    def book_params
       params.require(:book).permit(:title, :body)
    end
end
