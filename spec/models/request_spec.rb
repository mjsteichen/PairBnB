require 'rails_helper'


describe Request do
  describe "#associations" do
    it { should belong_to(:sender) }
    it { should belong_to(:residence) }
  end
end
