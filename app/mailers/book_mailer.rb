class BookMailer < ActionMailer::Base

  def book_created(user, book)
    @user = user
    @book = book
    
    mail(to: user.email,
        from: "bookapeclub@gmail.com",
        subject: "Your post about the book \'#{book.title}\' created",
        body: "Hi #{user.username} you have sucessfullly created your post about the book \'#{book.title}\' "
    )

  end
end
