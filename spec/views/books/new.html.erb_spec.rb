require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)

    assign(:book, Book.new(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :author => "Author",
      :user_id => @user.id
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[image]"

      assert_select "input[name=?]", "book[author_id]"

      assert_select "input[name=?]", "book[user_id]"
    end
  end
end
