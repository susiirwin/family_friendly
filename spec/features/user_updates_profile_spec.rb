require 'rails_helper'

describe "User Profile" do
  it "allows user to update profile information" do

    user = User.create(screen_name: "tester", uid: "1233455", oauth_token: "token", oauth_token_secret: "secret", name: "Tester McTester")
    visit '/'
    click_on "Log in with Twitter"
    click_on "Horace"
    expect(current_path).to eq('/dashboard')

    expect(page).to have_css("h2", :text => "My Zip Code:")
    expect(page).to have_css("h3", :text => "Number of Family Members:")
    expect(page).to have_css("h3", :text => "Number of Children age 0-1:")
    expect(page).to have_css("h3", :text => "Number of Children age 1-2:")
    expect(page).to have_css("h3", :text => "Number of Children age 2-3:")
    expect(page).to have_css("h3", :text => "Number of Children age 3-4:")
    expect(page).to have_css("h3", :text => "Number of Children age 4-5:")

    click_on "Edit Profile"

    expect(current_path).to eq("/users/#{User.last.id}/edit")

    fill_in "Zip code", with: 80202

    fill_in "total_family", with: 2
    fill_in "total_zero_to_one", with: 1

    click_on "Update"
    expect(current_path).to eq('/dashboard')

  end
end
