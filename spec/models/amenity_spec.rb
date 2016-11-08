require 'rails_helper'

RSpec.describe Amenity, type: :model do
  it { should have_many :businesses }
end
