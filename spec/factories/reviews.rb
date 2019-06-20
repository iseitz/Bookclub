FactoryBot.define do
 factory :review do
   content { "This is a review" }
   image  { "Image" }

#removed this association for now to avoid looping when creating
# reviews for the book in the book.rb factory
   association :book, factory: :book

   association :user, factory: :user
 end
end
