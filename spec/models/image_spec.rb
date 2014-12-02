require 'rails_helper'


describe Image do
  describe "#associations" do
    it { should belong_to(:residence)}
  end
end
