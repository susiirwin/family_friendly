require 'rails_helper'

describe "User Logs Into App" do
  it "displays a dashboard page" do
    stub_omniauth
    visit '/'
    click_on "Sign in with Twitter"
    expect(current_path).to eq('/')
    expect(page).to have_content("Horace")
    expect(page).to have_content("Logout")
    click_on "Horace"
    expect(current_path).to eq("/user/dashboard/#{user_id}")
  end
end
