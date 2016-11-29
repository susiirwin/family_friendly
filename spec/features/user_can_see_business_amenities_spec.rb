require 'rails_helper'

describe "Business show page" do
  it "displays comments from users" do
    VCR.use_cassette("sees_comments_for_business") do
      user = User.create!(screen_name: "User 1")
      crave = YelpService.search_business('crave-real-burgers-denver-3')
      business = Business.create!(
        name: crave.business.name,
        yelp_id: crave.business.id,
        street: crave.business.location.address,
        city: crave.business.location.city,
        state: crave.business.location.state_code,
        zip_code: crave.business.location.postal_code,
        phone: crave.business.display_phone,
        star_rating: crave.business.rating
      )
      review = business.reviews.create!(user_id: user.id, comments: "This place is phenomenal for my family!", family_rating: 4.0)

      visit "/businesses/#{business.yelp_id}"
      expect(page).to have_content("Crave Real Burgers")

      expect(page).to have_content("This place is phenomenal for my family!")

    end
  end
end
