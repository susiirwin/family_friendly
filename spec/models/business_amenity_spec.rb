require 'rails_helper'

RSpec.describe BusinessAmenity, type: :model do
  it { should belong_to :amenity }
  it { should belong_to :business }
end
