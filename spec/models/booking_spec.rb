require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to (:user) }
  it { should belong_to (:listing) }
end
