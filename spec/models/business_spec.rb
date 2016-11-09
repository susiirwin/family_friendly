require 'rails_helper'

RSpec.describe Business, type: :model do
  context "validations" do
    it { should have_many :amenities }
    it { should have_many :reviews }
  end

  it 'can return the average family friendly rating' do
    business = Business.create!(name: "Test Cafe")
    business2 = Business.create!(name: "Test Diner")
    user = User.create!(screen_name: "User 1")
    user2 = User.create!(screen_name: "User 2")
    review1 = business.reviews.create!(user_id: user.id, family_rating: 4.0)
    review2 = business.reviews.create!(user_id: user2.id, family_rating: 5.0)
    review3 = business2.reviews.create!(user_id: user.id, family_rating: 5.0)

    average = business.average_family_friendly_rating
    expect(average).to eq(4.5)
  end
end
