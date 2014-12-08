require 'rails_helper'


describe ResidencesController do
  let!(:test_user) {User.create!(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")}
  let!(:residence) {Residence.create!(user: test_user, city: "Chicago", state: "IL", zip_code: "12345", description: "It's hella decent" )}

  it { should route(:get, '/residences').to(action: :index) }
  it { should route(:get, '/residences/1').to(action: :show, id: 1) }

  describe 'GET #index' do
    it 'assigns all the residences as @residences' do
      get :index
      expect(assigns(:residences)).to eq(Residence.all)
    end
  end

  describe 'GET #show' do
    it 'assigns a message to be @message' do
      get :show, { id: residence.to_param}
      expect(assigns(:message)).to be
    end

    it 'assigns a particular residence to @residence by id' do
      get :show, {id: residence.to_param}
      expect(assigns(:residence)).to eq(residence)
    end
  end

  describe 'GET #new' do
    it 'assigns a new residence as @residence' do
      get :new
      expect(assigns(:residence)).to be_a_new(Residence)
    end
  end

  describe 'POST #create' do
    context "when valid params are passed" do
      it 'assigns a new residence as @residence' do
        residence_params = {residence: {city: "Chicago", state: "IL", zip_code: "12345", description: "It's hella decent"} }

        user = User.create(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")
        allow(controller).to receive(:current_user) {user}


        post :create, residence_params
        expect(assigns(:residence)).to eq(Residence.last)
      end
    end
    context "when invalid params are passed" do
      it "assigns a newly created but unsaved residence as @residence" do
        residence_params = {residence: {state: "IL", zip_code: "12345", description: "It's hella decent"} }
        user = User.create(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")
        allow(controller).to receive(:current_user) {user}
        post :create, residence_params
        expect(assigns(:residence)).to be_a_new(Residence)
      end

      it 'renders the new template after attempt' do
        residence_params = {residence: {state: "IL", zip_code: "12345", description: "It's hella decent"} }
        user = User.create(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")
        allow(controller).to receive(:current_user) {user}
        post :create, residence_params
        expect(response).to render_template("new")
      end
    end
  end
end
