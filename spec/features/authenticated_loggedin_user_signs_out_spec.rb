# frozen_string_literal: true

require 'rails_helper.rb'

# As an authenticated user
# I want to sign outdent
# So that no one else can post items or reviews on my behalf

feature 'user can sign out of their account' do
  it 'allows the logged in user to sign out of their account' do
    @user1 = FactoryBot.create(:user, username: 'booksfan')
    sign_in @user1
    visit '/'
    click_link 'Sign_out'
    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Welcome to our Book Club!')
  end
end
