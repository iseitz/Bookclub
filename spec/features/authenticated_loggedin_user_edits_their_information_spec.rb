require 'rails_helper.rb'
# User Story:
# As an authenticated user
# I want to update my information
# So that I can keep my profile up to date


 feature "authenticated user can edit their account information" do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it "allows authenticated user to update their bio" do
    visit "/"
    click_link "Your Profile"
    click_link "Edit Profile"
    fill_in "Bio", with: "I am an avid booklover and up until now I have read 1000 boooks"
    fill_in "Current password", with: @user.password
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("\nHello, #{@user.username} - Sign_out\n")
    expect(page).to have_content("Your Profile")
    expect(page).to have_content("Welcome to our Book Club!")
    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Edit Profile")
  end

  it "allows authenticated user to update their username" do
    @new_username = "Bookworm"
    visit "/"
    click_link "Your Profile"
    click_link "Edit Profile"
    fill_in "Username", with: @new_username
    fill_in "Current password", with: @user.password
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("\nHello, #{@new_username} - Sign_out\n")
    expect(page).to have_content("Your Profile")
    expect(page).to have_content("Welcome to our Book Club!")
    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Edit Profile")
  end

  it "allows authenticated user to update their avatar" do
    visit "/"
    click_link "Your Profile"
    click_link "Edit Profile"
    fill_in "Bio", with: "I am an avid booklover and up until now I have read 1000 boooks"
    page.attach_file ("#{Rails.root}/spec/support/images/photo.jpeg")
    fill_in "Current password", with: @user.password
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("\nHello, #{@user.username} - Sign_out\n")
    expect(page).to have_content("Your Profile")
    expect(page).to have_content("Welcome to our Book Club!")
    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Edit Profile")
    click_link "Your Profile"
    expect(page).to have_content("I am an avid booklover and up until now I have read 1000 boooks")
    expect(page).to have_content("#{@user.username}")
    expect(page).to have_content("Username")
    expect(page).to_not have_content("Update User")
    expect(page).to have_content("Edit Profile")
    expect(page).to have_css("img[src*= 'photo.jpeg']")
  end
end
