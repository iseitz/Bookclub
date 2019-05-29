class RaterController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
    @rating = Rate.where(rateable_id: book.id)

  end


  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      render :json => true
    else
      render :json => false
    end
  end
end
