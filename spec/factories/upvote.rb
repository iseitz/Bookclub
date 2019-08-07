FactoryBot.define do
  factory :upvote do
    user
    book
    upvote { 'true' }
  end
end
