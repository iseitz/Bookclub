require 'rails_helper.rb'
# User Story:
# As an unauthenticated user
# I want to sign in
# So that I can post items and review them


feature "unauthenticated user can sign into their account" do
  before (:each) do
    @user = FactoryBot.create(:user)
  end
  
  it "signs in the authenticated user" do
    visit "/"
    click_link "Sign_in"
    fill_in 'Email', with: "#{@user.email}"
    fill_in 'Password', with: "#{@user.password}"
    click_button 'Log in'

    expect(page).to have_content("Hello, #{@user.username} - Sign_out")
  end

  it " does not sign in the user with invalid password" do
    visit "/"
    click_link "Sign_in"
    fill_in 'Email', with: "#{@user.email}"
    fill_in 'Password', with: "#{@user.password}" + "123"
    click_button 'Log in'

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

end
