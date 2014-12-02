require 'rails_helper'

describe Message do
  describe "#validations" do
    it { should validate_presence_of(:sender_id) }
    it { should validate_presence_of(:recipient_id) }
    it { should validate_presence_of(:text) }
  end
  describe "#associations" do
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end
end
