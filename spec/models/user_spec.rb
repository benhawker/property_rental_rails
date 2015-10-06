require 'rails_helper'

RSpec.describe User, type: :model do
   it { should have_many (:listings) }
   it { should have_many (:ratings) }
end


