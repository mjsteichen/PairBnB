require 'rails_helper'

describe Residence do
  let(:emily) { User.create!(name: "emily", email: "emily@emily.com", password: "password")}
  let(:emilys_house) { Residence.new(user_id: emily.id, city: "Chicago", state: "IL", zip_code: "60602", neighborhood: "Loop", description: "Great place! Come on by!")}

  describe "#validations" do
    it 'should save when params are valid' do
      expect(emilys_house.save).to be_truthy
    end

    it 'should not save when params are invalid' do
      @bad_house = Residence.new(user_id: emily.id, city: "Chicago", state: "IL")
      expect(@bad_house.save).to be_falsey
    end

    it 'should take neighborhood as an optional argument' do
      @sorta_house = Residence.new(user_id: emily.id, city: "Chicago", state: "IL", zip_code: "60602")
      expect(@sorta_house.save).to be_truthy
    end
  end
  describe "#search" do
  pending
    it 'should search database for cities' do
      expect{Residence.search("Chicago").count.to eq()}
    end
  end


end
