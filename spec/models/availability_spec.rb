require 'rails_helper'

describe Availability do
  it { should belong_to(:residence) }
  it { should belong_to(:pairing) }
end
