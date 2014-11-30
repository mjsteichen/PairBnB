require 'rails_helper'

describe Shoutout do
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
  it { should validate_presence_of(:text) }
  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }
end
