require 'rails_helper'

RSpec.describe "books/index", type: :view do
  let(:book1) { create(:book) }
  let (:book2) { create(:book) }
  before(:each) do
    assign(:books, [
      book1,
      book2
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "description".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
