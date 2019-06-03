json.extract! book, :id, :title, :description, :image, :author, :user_id, :created_at, :updated_at, :upvote, :downvote
json.url book_url(book, format: :json)
