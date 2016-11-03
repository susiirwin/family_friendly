require 'rails_helper'

describe "Oauth with Twitter" do
  it "can allow a user to log in with Twitter account" do
    stub_omniauth

    visit '/'
    click_on "Sign in with Twitter"
    expect(current_path).to eq('/')
    expect(page).to have_content("Horace")
    expect(page).to have_content("Logout")
  end
end
