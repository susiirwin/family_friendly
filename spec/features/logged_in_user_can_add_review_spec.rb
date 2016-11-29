require 'rails_helper'

describe "Business reviews" do
  it "can allow a logged in user to write a review" do
    VCR.use_cassette("user_writes_review", record: :new_episodes) do
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
      stub_omniauth

      visit '/'
      click_on "Log in with Twitter"
      expect(current_path).to eq('/')

      fill_in "search", with: "Crave Real Burgers"
      click_on "Submit"

      first('div.results h3').click_on "See Details"

      expect(page).to have_content("Crave Real Burgers")
      expect(page).to have_content("Average Yelp Rating: 4.5")

      click_on "Add a Family Friendly Review"

      expect(current_path).to eq(new_business_review_path(business.id))


      fill_in "review[comments]", with: "This is a review."

      choose('review_family_rating_1')

      click_on "Create Review"

    end
  end
end
