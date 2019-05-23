require 'rails_helper.rb'
# User Story:
# As an authenticated user
# I want to add a book post
# So that others can review it


feature "authenticated user can create a book post" do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
    @book = FactoryBot.create(:book)
  end


  it "allows authenticated user create the bookpost with title, description and author" do
    visit "/"
    click_link "Discover Books"
    click_link "New Book"
    fill_in "Title", with: @book.title
    fill_in "Description", with: @book.description
    fill_in "Author firstname", with: @book.author_firstname
    fill_in "Author lastname", with: @book.author_lastname
    click_button "Create Book"


    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("#{@book.title}")
    expect(page).to have_content("Author:")
    expect(page).to have_content("#{@book.author_firstname} #{@book.author_lastname}")
    expect(page).to have_content("Description:")
    expect(page).to have_content("#{@book.description}")
  end


  it "allows authenticated user create the bookpost with an uploaded image of it" do
    visit "/"
    click_link "Discover Books"
    click_link "New Book"
    fill_in "Title", with: @book.title
    fill_in "Description", with: @book.description
    fill_in "Author firstname", with: @book.author_firstname
    fill_in "Author lastname", with: @book.author_lastname
    page.attach_file ("#{Rails.root}/spec/support/images/photo.jpeg")
    click_button "Create Book"


    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("#{@book.title}")
    expect(page).to have_css("img[src*= 'photo.jpeg']")
  end

  it "allows authenticated user create the bookpost with a star rating" do
    visit "/"
    click_link "Discover Books"
    click_link "New Book"
    fill_in "Title", with: @book.title
    fill_in "Description", with: @book.description
    fill_in "Author firstname", with: @book.author_firstname
    fill_in "Author lastname", with: @book.author_lastname
    page.attach_file ("#{Rails.root}/spec/support/images/photo.jpeg")
    fill_in "Rating", with: "5"
    click_button "Create Book"


    expect(page).to have_content("Rating")
    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("#{@book.title}")
    expect(page).to have_css("img[src*= 'photo.jpeg']")
  end
end
