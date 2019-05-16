require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { build(:book) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author_firstname) }
  it { is_expected.to validate_presence_of(:author_lastname) }
  it {  is_expected.to validate_presence_of(:description) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:reviews) }

  context "it has title, description, author, images, user_id and reviews" do
    before(:each) do
      @book = FactoryBot.create(:book,
         title:"Amazing book",
         description: "Incredible book. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Maecenas a convallis lorem.
        Quisque egestas vestibulum felis tincidunt euismod.
        Aliquam varius ligula vitae commodo laoreet.
        Pellentesque bibendum neque ex, nec molestie sapien mattis sed.
        Fusce ultricies est quis odio dapibus, quis hendrerit nunc pulvinar.
        Nunc dapibus ornare libero, eget tristique nibh sodales nec.
        Aenean ante diam, volutpat eu ex eu, semper mattis dolor.
        Ut est nulla, scelerisque ac consectetur id, faucibus vel sapien.
        Aliquam elementum libero quis mattis congue.
        Duis ac volutpat mauris, et varius felis.
        Phasellus congue condimentum lorem, a tincidunt ipsum luctus nec.
        Nunc maximus eu orci id congue. Ut ante risus, pulvinar in tellus nec,
        porttitor varius massa. Etiam viverra erat vel mollis venenatis.
        Aliquam eu nisl egestas, egestas leo at, consectetur nunc.",
          author_firstname: "Author1",
          author_lastname: "Best",
          image: "Image1",
        )
    end

    it "has a title" do
      expect(@book.title).to eq("Amazing book")
    end

    it "has a description that can be more than 255 characters long" do
      expect(@book.description).to eq("Incredible book. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Maecenas a convallis lorem.
        Quisque egestas vestibulum felis tincidunt euismod.
        Aliquam varius ligula vitae commodo laoreet.
        Pellentesque bibendum neque ex, nec molestie sapien mattis sed.
        Fusce ultricies est quis odio dapibus, quis hendrerit nunc pulvinar.
        Nunc dapibus ornare libero, eget tristique nibh sodales nec.
        Aenean ante diam, volutpat eu ex eu, semper mattis dolor.
        Ut est nulla, scelerisque ac consectetur id, faucibus vel sapien.
        Aliquam elementum libero quis mattis congue.
        Duis ac volutpat mauris, et varius felis.
        Phasellus congue condimentum lorem, a tincidunt ipsum luctus nec.
        Nunc maximus eu orci id congue. Ut ante risus, pulvinar in tellus nec,
        porttitor varius massa. Etiam viverra erat vel mollis venenatis.
        Aliquam eu nisl egestas, egestas leo at, consectetur nunc.")
    end

    it "has an image included" do
      expect(@book.image).to eq("Image1")
    end

    it "has author first name and last name included" do
      expect(@book.author_firstname).to eq("Author1")
      expect(@book.author_lastname).to eq("Best")
    end
  end
end
