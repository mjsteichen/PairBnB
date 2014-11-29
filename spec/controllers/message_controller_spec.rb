require 'rails_helper'

describe MessagesController do
  before :each do
    @duke = User.create!(name: "Duke Greene", email: "dukegreene@gmail.com", password:"catscats")
    @test_user = User.create!(name: "Nate Delage", email: "natelovescats@gmail.com", password: "catscats")
  end

    describe 'GET #new' do
      it 'assigns a new message as @message' do
        get :new, { :user_id => @duke.id}
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

  describe 'POST #create' do
    context "when valid params are passed" do
      pending
      # it 'assigns a new message as @message' do
      #   user = User.create!(name: "Duke Greene", email: "duke@gmail.com", password:"catscats")
      #   allow(controller).to receive(:current_user) {user}
      #   emily = User.create!(name: "Emily", email: "emily@gmail.com", password:"catscats")
      #   residence = Residence.create!(user: emily, city: "Chicago", state: "IL", zip_code: "60606", neighborhood: "Gold Coast", description: "Pretty decent, except for all the tourists.")
      #   message = Message.create!(recipient_id: emily.id, text: "What do you a call a programmer that wears cut offs? A bro-grammer.", sender_id: user.id)

      #   print user.id
      #   post :create, { :user_id => emily.id}
      #   expect(assigns(:message)).to be
      # end
    end
  end
end
