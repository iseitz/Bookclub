require 'rails_helper.rb'


feature "visiting the main page displayig the books" do
  before(:each) do
    @book1 = FactoryBot.create(:book, title: "GoodBook1")
    @book2 = FactoryBot.create(:book, title: "GoodBook2")
  end

  context "logged in user visits the page with all books displayed" do

    it "allows the logged in user to see all the books on the page" do
      @user1 = FactoryBot.create(:user, username: "booksfan")
      sign_in @user1
      visit '/'
      click_link 'Discover Books'
      expect(page).to have_content("Hello, booksfan - Sign_out")
      expect(page).to have_content("GoodBook1")
      expect(page).to have_content("GoodBook2")
      expect(page).to have_link("New Book")
    end
  end

  context "logged off user visits the page with all books displayed" do

    it "allows the logged out user to see all the books on the page" do
      @user1 = FactoryBot.create(:user)

      sign_in @user1
      sign_out @user1
      visit '/'
      click_link 'Discover Books'

      expect(page).to have_content("GoodBook1")
      expect(page).to have_content("GoodBook2")
      expect(page).to have_link("Sign_in")
      expect(page).to have_link("Register")
      expect(page).to have_link("New Book")
    end
  end
end
