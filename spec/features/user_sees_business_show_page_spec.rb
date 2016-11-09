require 'rails_helper'

describe "Business show page" do
  it "displays single business result from API" do
    VCR.use_cassette("sees_a_single_business") do

      stub_omniauth
      visit '/'
      click_on "Log in with Twitter"
      expect(current_path).to eq('/')

      fill_in "search", with: "Cherry Cricket"

      click_on "Submit"
      expect(current_path).to eq(search_path)
      expect(page).to have_content("Cherry Cricket")
      expect(page).to have_content("2641 E 2nd Ave Southeast Denver CO 80206")

      first('div.results h3').click_on "See Details"
      expect(current_path).to eq("/businesses/cherry-cricket-denver")


      expect(page).to have_content("Cherry Cricket")
      expect(page).to have_content("Average Yelp Rating: 4.0")
      expect(page).to have_content("+1-303-322-7666")
      expect(page).to have_content("Average Family Friendly Rating:")
      expect(page).to have_content("2641 E 2nd Ave Southeast Denver CO 80206")

    end
  end
end
