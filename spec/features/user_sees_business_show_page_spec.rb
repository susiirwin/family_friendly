require 'rails_helper'

describe "Business show page" do
  it "displays a single business from API" do
    stub_omniauth
    visit '/'
    click_on "Log in with Twitter"
    expect(current_path).to eq('/')

    fill_in "Search", with: "Rio Grande Mexican Restaurant"
    click_on "Search"
    expect(current_path).to eq(search_path)

    click_on("Rio Grande Mexican Restaurant")

    expect(current_path).to eq(business_path)

    expect(page).to have_content("Rio Grande Mexican Restaurant")
    expect(page).to have_content("Rating: 3.5")
    expect(page).to have_content("Phone: 3036235432")
    expect(page).to have_content("Address: 1525 Blake St,
                                  Northwest,
                                  Denver, CO 80202")

  end
end
