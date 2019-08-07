require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:users) { User.all }
  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }
  let(:valid_session) { {} }

  describe "GET #index" do
    context "when the user is signed in as an admin" do
      before { sign_in admin }
      it "assigns all users to @users" do
        get :index
        expect(assigns['users']).to eq(users)
      end
      it "opens the page" do
          get :index
          expect(response.successful?).to be true
      end
    end

    context "when the user is signed in as a member" do
      before { sign_in user }
      it "redirects to the books path if the user is signed in as member" do
        get :index
        expect(response).to redirect_to books_path
      end
      it "does not open the requested page" do
          get :index
          expect(response.successful?).to_not be true
      end
    end

    context "when user is not signed in" do
      it "redirects to the sign in path if the user is not signed in" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
      it "does not open the requested page listing all users" do
          get :index
          expect(response.successful?).to_not be true
      end
    end
  end

  describe "GET #show" do

    context "user is signed in as memeber" do
      before { sign_in user }
      it "assignes user details to @user" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(assigns['user']).to eq(user)
      end
      it "returns a success response" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "user is signed in as admin" do
      before { sign_in admin }
      it "assignes user details to @user" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(assigns['user']).to eq(user)
      end
      it "returns a success response" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    context "user is not signed in" do
      it "assignes user details to @user" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(assigns['user']).to eq(user)
      end
      it "returns a success response" do
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
