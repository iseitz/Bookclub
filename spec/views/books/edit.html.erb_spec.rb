require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)

    @book = assign(:book, Book.create!(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :author => "Author",
      :user_id => @user.id
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[image]"

      assert_select "input[name=?]", "book[author_id]"

      assert_select "input[name=?]", "book[user_id]"
    end
  end
end
