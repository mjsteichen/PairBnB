require 'rails_helper'


describe User do
  let(:emily) { User.new(name: "emily", email: "emily@emily.com", password: "password")}

  describe "#validations" do
    it 'should save when params are valid' do
      expect(emily.save).to be_truthy
    end

    it 'should not save when params are invalid' do
      @bad_user = User.new(name: "Bob")
      expect(@bad_user.save).to be_falsey
    end

    it 'should require unique emails' do
      @new_user = User.new(name: "Jordan", email: "emily@emily.com", password: "catscats")
      @new_user.save
      expect(emily.save).to be_falsey
    end

    it 'should require passwords be a minimum of 8 digits' do
      @new_user = User.new(name: "Jordan", email: "jordan@gmail.com", password: "cats")
      expect(@new_user.save).to be_falsey
    end

    it 'should require a valid email' do
      @fake_user = User.new(name: "Jordan", email: "cats@gmail", password: "catscats")
      expect(@fake_user.save).to be_falsey
    end

    it { should have_secure_password }

    describe "#associations" do
      it { should have_many(:sent_messages)}
      it { should have_many(:received_messages)}
      it { should have_many(:sent_shoutouts)}
      it { should have_many(:received_shoutouts)}
      it { should have_many(:hosted_pairings)}
      it { should have_many(:visited_pairings)}
      it { should have_many(:residences)}
      it { should have_many(:availabilities)}
      it { should have_many(:residence_images)}
      end
  end

end
