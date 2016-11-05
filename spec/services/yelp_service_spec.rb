require 'rails_helper'

describe "YelpService" do

  it "connects" do
    VCR.use_cassette("connection_process") do
      params = { term: "restaurant", limit: 1 }

      expected_name = "Union Lodge No.1"
      response = YelpService.conn(params)
      expect(response.businesses[0].name).to eq(expected_name)
      expect(response.businesses[0].phone).to eq("7203890447")
      expect(response.businesses[0].rating).to eq(5.0)
    end
  end
end
