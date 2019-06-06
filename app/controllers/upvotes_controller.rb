class UpvotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  before_action :set_user



  # def create
  #   @user = current_user
  #   @upvote.user_id = @user.id
  #   @upvote = @book.upvotes.build(upvote_params)
  #
  #   respond_to do |format|
  #     if @upvote.save
  #       format.html { redirect_to @book }
  #       format.json { render :show, status: :created, location: @book }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @upvote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def book_upvotes
    @upvotes = Upvotes.where(book_id: @book.id).length
  end

  def destroy
    @upvote = Upvote.destroy(params[:id])
      respond_to do |format|
        format.js
      end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_user
    @user = current_user
  end

  def upvote_params
      params.require(:upvote).permit(:user_id, :book_id, :upvote)
  end

end
