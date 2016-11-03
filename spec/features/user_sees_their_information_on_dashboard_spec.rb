require 'rails_helper'

describe "User Dashboard" do
  it "shows user information" do
    stub_omniauth
    visit '/'
    click_on "Log in with Twitter"
    visit '/dashboard'
    expect(current_path).to eq('/dashboard')
    expect(page).to have_css("h2", :text => "Horace")
    expect(page).to have_css("h2", :text => "My Zip")

    expect(page).to have_css("h3", :text => "Number of Children age 0-1:")
    expect(page).to have_css("h3", :text => "Number of Children age 1-2:")
    expect(page).to have_css("h3", :text => "Number of Children age 2-3:")
    expect(page).to have_css("h3", :text => "Number of Children age 3-4:")
    expect(page).to have_css("h3", :text => "Number of Children age 4-5:")

  end
end
