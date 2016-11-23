require 'rails_helper'

describe "Business index page" do
  it "displays all  business search results from API" do
    VCR.use_cassette("sees_all_results_business") do
      stub_omniauth
      visit '/'
      click_on "Log in with Twitter"
      expect(current_path).to eq('/')

      fill_in "search", with: "Rio Grande Mexican Restaurant"
      click_on "Submit"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Rio Grande Mexican Restaurant")
      expect(page).to have_content("1525 Blake St, Northwest, Denver, CO 80202")
    end
  end
end
