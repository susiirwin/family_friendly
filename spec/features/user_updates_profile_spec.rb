require 'rails_helper'

describe "User Profile" do
  it "allows user to add family member" do

    user = User.create(screen_name: "tester", uid: "1233455", oauth_token: "token", oauth_token_secret: "secret", name: "Tester McTester")
    visit '/'
    click_on "Log in with Twitter"
    click_on "Horace"
    expect(current_path).to eq('/dashboard')

    click_on "Add Family Member"

    expect(current_path).to eq(new_users_family_path)

    fill_in "family_name", with: "Jacoby"
    fill_in "family_age", with: 2

    click_on "Add Family Member"
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Jacoby")
    expect(page).to have_content(2)

  end
end
