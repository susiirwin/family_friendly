require 'rails_helper'

describe "User Dashboard" do
  it "shows user information" do
    stub_omniauth
    visit '/'
    click_on "Log in with Twitter"
    visit '/dashboard'
    expect(current_path).to eq('/dashboard')
    expect(page).to have_css("h2", :text => "Horace")

  end
end
