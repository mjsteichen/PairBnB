require 'rails_helper'


describe Pairing do
  let(:emily) { User.create!(name: "emily", email: "emily@emily.com", password: "password")}
  let(:michael) { User.create!(name: "michael", email: "michael@michael.com", password: "password")}
  let(:test_pairing) { Pairing.new(host_id: emily.id, visitor_id: michael.id) }

  describe "#associations" do
    it { should belong_to(:host) }
    it { should belong_to(:visitor) }
  end

  describe "#validations" do
    it 'should save when params are valid' do
      expect(test_pairing.save).to be_truthy
    end

    it 'should not save when params are invalid' do
      @bad_pairing = Pairing.new(visitor_id: michael.id)
      expect(@bad_pairing.save).to be_falsey
    end

    it 'should not save when params are invalid' do
      @bad_pairing = Pairing.new(host_id: emily.id)
      expect(@bad_pairing.save).to be_falsey
    end

    it { should validate_presence_of(:host_id) }
    it { should validate_presence_of(:visitor_id) }
  end

end
