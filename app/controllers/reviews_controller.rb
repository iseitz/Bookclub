class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book
  before_action :set_review, only: [:edit, :update]

  def edit

  end

  def create
    @review = @book.reviews.build(review_params)
    @book_user = User.find(@book.user_id)
    @review.user_id = current_user.id

    ReviewMailer.review_created(current_user, @book_user, @review.content, @book).deliver
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @book, notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = current_user
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to @book
  end


  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:id, :content, :image, :user_id, :book_id)
  end

end
