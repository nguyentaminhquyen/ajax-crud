class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show	 
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
  	@books = Book.all
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	unless @book.save
	  	respond_to do |f|
	  		f.html { redirect_to books_url }
	  		f.js
	  	end
  	end

  end

  def update
  	unless @book.update(book_params)
	  	respond_to do |f|
	  		f.html { redirect_to books_url }
	  		f.js
	  	end  		

  	end 
  end

  def destroy
     @book.destroy
     respond_to do |f|
     	f.html { redirect_to books_url }
     	f.js
     end 
  end

  private 
    def set_book
    	@book = Book.find(params[:id])
    end

    def book_params
    	params.require(:book).permit(:name,:description,:author_name)
    end

    def admin_only
	    unless current_user.admin?
	      redirect_to root_path, :alert => "Access denied."
	    end
    end
end
