class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    @book_user = User.find(@book.user_id)

    ReviewMailer.review_created(current_user, @book_user, @review.content, @book).deliver

    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:content, :image, :user_id)
  end

end
