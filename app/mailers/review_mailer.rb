class ReviewMailer < ActionMailer::Base

  def review_created(current_user, book_user, content, book )

    @current_user = current_user
    @book_user = book_user
    @content = content
    @book = book

    mail(to: book_user.email,
        from: "bookapeclub@gmail.com",

    )
  end
end
