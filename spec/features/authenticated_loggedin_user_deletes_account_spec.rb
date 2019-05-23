require 'rails_helper.rb'
# User Story:
# As an authenticated user
# I want to delete my account
# So that my information is no longer retained


feature "authenticated user can delete their account with information" do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it "allows authenticated user to delete their account" do
    visit "/"
    click_link "Your Profile"
    click_link "Edit Profile"
    fill_in "Current password", with: @user.password
    click_button "Cancel my account"
    # click_button "OK"
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to have_content("Welcome to our Book Club!")
    expect(page).to have_content("Sign_in Register")
    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Edit Profile")
  end

  it "the app keeps and displays book posts of the deleted user" do
    @book = FactoryBot.create(:book)
    @user1 = FactoryBot.create(:removed_user)
    # @user1 = User.create!(email: 'gamefan0@gmail.com',
    #                       username: 'removedUser',
    #                       password: 'password',
    #                       password_confirmation: 'password',
    #                       role:'inactive')

    visit "/"
    click_link "Discover Books"
    click_link "New Book"
    fill_in "Title", with: @book.title
    fill_in "Description", with: @book.description
    fill_in "Author firstname", with: @book.author_firstname
    fill_in "Author lastname", with: @book.author_lastname
    page.attach_file ("#{Rails.root}/spec/support/images/photo.jpeg")
    click_button "Create Book"

    click_link "Your Profile"
    click_link "Edit Profile"
    fill_in "Current password", with: @user.password
    click_button "Cancel my account"
    # click_button "OK"
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to have_content("Welcome to our Book Club!")
    expect(page).to have_content("Sign_in Register")
    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Edit Profile")

    click_link "Discover Books"
    save_and_open_page
    expect(page).to have_content("#{@book.title}")
    expect(page).to have_content("#{@book.author_firstname} #{@book.author_lastname}")
    expect(page).to have_content("Posted by #{@user1.username}")
    expect(page).to have_content("#{@book.description}")
  end
end
