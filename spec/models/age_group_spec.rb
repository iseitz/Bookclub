require 'rails_helper'

RSpec.describe AgeGroup, type: :model do
  describe "validations" do
    subject { FactoryBot.create(:age_group) }
    it { is_expected.to validate_presence_of(:group) }
    it { is_expected.to validate_uniqueness_of(:group).ignoring_case_sensitivity  }
    it { is_expected.to have_many(:books) }
  end

  describe "#group" do
    before(:each) do
      @age_group = FactoryBot.create(:age_group)
    end

    after(:each) do
      @age_group.destroy
    end

    it "Has a group set with a step of 1 year" do
      @range1 = @age_group.group.first.to_i
      @range2 = @age_group.group.last.to_i
      expect(@range2 - @range1).to eq(1)
    end

  end
end
