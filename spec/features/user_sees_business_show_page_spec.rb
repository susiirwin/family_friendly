require 'rails_helper'

describe "Business show page" do
  xit "displays single business result from API" do
    VCR.use_cassette("sees_a_single_business") do


      stub_omniauth
      visit '/'
      click_on "Log in with Twitter"
      expect(current_path).to eq('/')

      fill_in "search", with: "Cherry Cricket"

      click_on "Submit"

      expect(current_path).to eq(search_path)

      expect(page).to have_content("Cherry Cricket")
      expect(page).to have_content("Average Yelp Rating: 4.0 Stars")
      expect(page).to have_content("3033227666")
      expect(page).to have_content('["2641 E 2nd Ave", "Southeast", "Denver, CO 80206"]')

      first('div.results h3').click_on "See Details"

      expect(current_path).to eq(business_path(business.id))

      expect(page).to have_content("Cherry Cricket")
      expect(page).to have_content("Average Yelp Rating: 4.0 Stars")
      expect(page).to have_content("3033227666")
      expect(page).to have_content('["2641 E 2nd Ave", "Southeast", "Denver, CO 80206"]')

    end
  end
end
