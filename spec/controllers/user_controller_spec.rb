require 'rails_helper'


describe UsersController do
  let!(:user) {User.create!(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")}

  describe "GET #new" do
    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it 'creates a new User' do
        user_params = {user: {name: "Duke Green", email: "Duke@gmail.com", password: "catscats"} }
        expect{ post :create, user_params}.to change{User.count}.by(1)
      end

      it "assigns a newly created user as @user" do
        user_params = {user: {name: "Mike Steich", email: "yomike@gmail.com", password: "coffeeking"} }
        post :create, user_params
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the created user's show page" do
        user_params = {user: {name: "Mike Steich", email: "yomike@gmail.com", password: "coffeeking"} }
        post :create, user_params
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved user as @user" do
        user_params = {user: {name: "Mike Steich", password: "coffeeking"} }
        post :create, user_params
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the new template after attempt" do
        user_params = {user: {name: "Mike Steich", password: "coffeeking"} }
        post :create, user_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    it 'finds a user and assigns them to @user' do
      get :show, { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    it 'assigns @user to a user with a particular id' do
      get :edit, { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT #update" do
      pending
    it 'assigns @user to a user with a particular id' do
      # post :update, { id: user.to_param, name: "Test", email: "test@gmail.com", github_url: "github.com/test", twitter_url: "@test", bio: "I was born once" }
      # expect(assigns(:user)).to eq(user)
    end

      pending
    it 'updates @users info with the new params' do
    end
  end

end
