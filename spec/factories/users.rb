FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "gamefan#{n}@gmail.com" }
    sequence(:username) { |n| "booksfan#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'member' }
     # if we do not test the mails sent out we can use this model:
    after(:build) { |u| u.skip_confirmation_notification! }
    after(:create) { |u| u.confirm }

    trait :admin do
      role { 'admin'}
    end

    trait :removed_user do
      username { 'removedUser'}
      role { 'inactive'}
    end
    factory :removed_user, traits: [:removed_user]
    factory :admin, traits: [:admin]
   end
end


# Can also create a completely separate confirmed_user factory and set it this way:
# FactoryBot.define :confirmed_user, :parent => :user do |f|
#   f.after_create { |user| user.confirm }
# end


# # alternative versions of doing it are to use confirmed_at at the moment of the creation of the user:
#
# confirmed_at 7.days.ago
# confirmed_at Time.now
