class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_book, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def search
   if params[:search].present?
     @books = Book.search(params[:search])
   else
     @books = Book.all
   end
  end

  def age_group
    if params[:age_group_id].present?
      @group = AgeGroup.find(params[:age_group_id])
      @books = Book.where(age_group_id: @group.id)
      @user = current_user
    end
  end

  def upvoted?
    Upvote.where(user_id: current_user.id, book_id: @book.id).exists?
  end

  def downvoted?
    Downvote.where(user_id: current_user.id, book_id: @book.id).exists?
  end

  def upvote
    if !(upvoted?)
      if downvoted?
        @user_downvote = @book.downvotes.where(user_id: current_user.id).first
        Downvote.destroy(@user_downvote.id)
      end
      Upvote.create(book: @book, user: current_user, upvote: params[:upvote])
      respond_to do |format|
          format.html { redirect_to @book, flash[:success] = "Your upvote counted!"}
          format.js
      end
    end
  end

  def downvote
    if !(downvoted?)
      if upvoted?
        @user_upvote = @book.upvotes.where(user_id: current_user.id).first
        Upvote.destroy(@user_upvote.id)
      end
      Downvote.create(book: @book, user: current_user, downvote: params[:downvote])
      respond_to do |format|
          format.html { redirect_to @book, flash[:success] = "Your downvote counted!"}
          format.js
      end
    end
  end



  # GET /books
  # GET /books.json
  def index
    if !age_group
    @books = Book.all
    @user = current_user
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if User.where(id: "#{@book.user_id}".to_i).exists?(conditions = :none)
      @user = User.find(@book.user_id)
    else
      @user = User.find_by(username: 'removedUser')
    end
    @rating = Rate.where(rateable_id: @book.id)
    if @rating.length != 0
       @sum = 0
       @rating.each do |rate|
       @sum += rate.stars_num
       end
       @final_rating = @sum/@rating.length
       @remaining_stars = 5 - @final_rating
    end
  end

  # GET /books/new
  def new
    @book = current_user.books.build
    @age_groups = AgeGroup.all
  end

  # GET /books/1/edit
  def edit
    @age_groups = AgeGroup.all
  end

  # POST /books
  # POST /books.json
  def create
    @age_groups = AgeGroup.all
    @user = current_user
    @book = @user.books.build(book_params)
    @book.user_id = current_user.id

    respond_to do |format|
      if @book.save

        BookMailer.book_created(@user, @book).deliver

        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:id, :title, :description, :image, :user_id, :author_firstname, :author_lastname, :upvote, :downvote, :age_group_id, :group)
    end
end
