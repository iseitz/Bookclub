FactoryBot.define do
  factory :book do
    user
    age_group
    sequence(:title) { |n| "GoodBook#{n}" }
    sequence(:author_lastname) { |n| "Author#{n}" }
    author_firstname { 'Best' }
    description { 'description' }
    image { 'image' }

    after(:build) do |book|
      book.reviews { create_list(:review, 3) }
    # book.reviews << build(:review)
   end

  end
end
