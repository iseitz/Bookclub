require 'rails_helper.rb'

feature 'Creating post with a book' do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'creates post with a book' do
    visit '/'
    click_link 'Discover Books'
    click_link 'New Book'
    fill_in 'Title', with: 'title'
    fill_in 'Description', with: 'description'
    fill_in 'Image', with: 'image'
    fill_in 'Author firstname', with: 'Best'
    fill_in 'Author lastname', with: 'Author1'
    click_button 'Create Book'
    expect(page).to have_content('title')
    expect(page).to have_content('description')
    expect(page).to have_content('image')
    expect(page).to have_content('Author')
    expect(page).to have_content('Best Author1')
  end

end
