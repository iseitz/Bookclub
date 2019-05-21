require 'rails_helper.rb'

feature 'Creating post with a book' do
  before (:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'allows user to create post with details of the book' do
    visit '/'
    click_link 'Discover Books'
    click_link 'New Book'
    fill_in 'Title', with: 'title'
    fill_in 'Description', with: 'description'
    fill_in 'Author firstname', with: 'Best'
    fill_in 'Author lastname', with: 'Author1'
    click_button 'Create Book'

    expect(page).to have_content('title')
    expect(page).to have_content('description')
    expect(page).to have_content('Author')
    expect(page).to have_content('Best Author1')
    expect(page).to have_content('Book was successfully created.')
  end

  it 'allows user to upload 1 image of the book' do
    visit '/'
    click_link 'Discover Books'
    click_link 'New Book'
    fill_in 'Title', with: 'title'
    fill_in 'Description', with: 'description'
    fill_in 'Author firstname', with: 'Best'
    fill_in 'Author lastname', with: 'Author1'
    page.attach_file ("#{Rails.root}/spec/support/images/photo.jpeg")
    click_button 'Create Book'

    expect(page).to have_content('title')
    expect(page).to have_content('description')
    expect(page).to have_content('Author')
    expect(page).to have_content('Best Author1')
    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_css("img[src*= 'photo.jpeg']")
  end

end
