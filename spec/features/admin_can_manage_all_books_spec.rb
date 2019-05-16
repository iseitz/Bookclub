require 'rails_helper.rb'
# User Story:
# As a prospective user
# I want to create an account
# So that I can post items and review them


xfeature "prospective user can create an account" do
  before (:each) do
    @user = FactoryBot.create(:user)
  end

  xit "creates a new account if user fills in all fields with valid details" do
    visit "/"
    click_link "Register"
    fill_in 'Username', with: "#{@user.username}" + "1"
    fill_in 'Email', with: "#{@user.email}" + "1"
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
