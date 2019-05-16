require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
  it {  is_expected.to validate_presence_of(:email) }

  it {  is_expected.to validate_presence_of(:role) }
  it {  is_expected.to validate_presence_of(:encrypted_password) }
  it { is_expected.to have_many(:books) }
  it { is_expected.to have_many(:reviews) }

  context "it has admin role" do
    before(:each) do
      @user = FactoryBot.create(:user, role: "admin")
    end

    it "is admin if the role is admin" do
      expect(@user.admin?).to eq(true)
      expect(@user.role).to eq("admin")
      expect(@user.member?).to eq(false)
    end

    it "is not member if the role is admin" do
      expect(@user.role).to eq("admin")
      expect(@user.role).to_not eq("member")
      expect(@user.member?).to eq(false)
    end
  end

  context "it has member role" do
    before(:each) do
      @user = FactoryBot.create(:user)
    end

    it "is member if the role is member" do
      expect(@user.admin?).to eq(false)
      expect(@user.role).to eq("member")
      expect(@user.member?).to eq(true)
    end

    it "is not admin if the role is member" do
      expect(@user.admin?).to eq(false)
      expect(@user.role).to_not eq("admin")
      expect(@user.member?).to eq(true)
    end

  end

end
