require 'rails_helper'

describe "YelpService" do

  it "connects for all search" do
    VCR.use_cassette("connection_process") do
      params = { term: "restaurant", limit: 1 }

      expected_name = "Union Lodge No.1"
      response = YelpService.conn(params)
      expect(response.businesses[0].name).to eq(expected_name)
      expect(response.businesses[0].phone).to eq("7203890447")
      expect(response.businesses[0].rating).to eq(5.0)
      expect(response.businesses[0].location.display_address).to eq(["1543 Champa St", "Northwest", "Denver, CO 80202"])
    end
  end

  it "connects to business search" do
    VCR.use_cassette("business_connection") do
      params = { id: "cherry-cricket-denver"}

      expected_name = "Cherry Cricket"
      response = YelpService.search_business(params)
      expect(response.business.name).to eq(expected_name)
      expect(response.business.rating).to eq(4.0)
      expect(response.business.display_phone).to eq("+1-303-322-7666")
      expect(response.business.location.display_address).to eq(["2641 E 2nd Ave", "Southeast", "Denver, CO 80206"])
    end
  end
end
