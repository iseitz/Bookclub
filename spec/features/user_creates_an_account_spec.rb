# frozen_string_literal: true

require 'rails_helper.rb'
# User Story:
# As a prospective user
# I want to create an account
# So that I can post items and review them

feature 'prospective user can create an account' do
  before (:each) do
    @user = FactoryBot.create(:user)
  end

  it 'creates a new account if user fills in all fields with valid details' do
    visit '/'
    click_link 'Register'
    fill_in 'Username', with: @user.username.to_s + '1'
    fill_in 'Email', with: @user.email.to_s + '1'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'

    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
  end

  it ' displays error message and does not create a new account if the user provides invalis details' do
    visit '/'
    click_link 'Register'
    fill_in 'Username', with: @user.username.to_s + '1'
    fill_in 'Email', with: '1'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'

    expect(page).to have_content('1 error prohibited this user from being saved:')
    expect(page).to have_content('Email is invalid')
  end

  it ' displays error message and does not create a new account if the empty form is submitted' do
    visit '/'
    click_link 'Register'
    fill_in 'Username', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    expect(page).to have_content('4 errors prohibited this user from being saved:')
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Encrypted password can't be blank")
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign up')
  end
end
