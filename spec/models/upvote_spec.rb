require 'rails_helper'

RSpec.describe Upvote, type: :model do
  describe 'associations' do
     it { should belong_to(:book).class_name('Book') }
     it { should belong_to(:user).class_name('User') }
  end
  context "it can be set to be true or false" do

    before(:each) do
      @upvote = FactoryBot.create(:upvote)
    end

    it "is created and set to true if the user clicked the button" do
      expect(@upvote.upvote).to be(true)
    end

    it "is set to false when the user clicks the downvote button" do
      @upvote.upvote = 'false'
      @upvote.save!
      expect(@upvote.upvote).to be(false)
    end
  end
end
