require 'rails_helper'

RSpec.describe Business, type: :model do
  it { should have_many :amenities }
  it { should have_many :reviews }
end
