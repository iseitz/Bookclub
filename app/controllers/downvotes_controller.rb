# frozen_string_literal: true

class DownvotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  before_ation :set_user

  # def create
  #   @user = current_user
  #   @downvote.user_id = @user.id
  #   @downvote = @book.downvotes.build(downvote_params)
  #
  #   respond_to do |format|
  #     if @downvote.save
  #       format.html { redirect_to @book }
  #       format.json { render :show, status: :created, location: @book }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @downvote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def book_downvotes
    @downvotes = Downvotes.where(book_id: @book.id).length
  end

  def destroy
    @downvote = Downvote.destroy(params[:id])
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

  def downvote_params
    params.require(:downvote).permit(:user_id, :book_id, :downvote)
  end
end
