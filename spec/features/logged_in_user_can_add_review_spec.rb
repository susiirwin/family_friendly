require 'rails_helper'

describe "Business reviews" do
  it "can allow a logged in user to write a review" do
    VCR.use_cassette("user_writes_review") do
      stub_omniauth

      visit '/'
      click_on "Log in with Twitter"
      expect(current_path).to eq('/')

      fill_in "search", with: "Crave Real Burgers"
      click_on "Submit"

      first('div.results h3').click_on "See Details"

      expect(page).to have_content("Crave Real Burgers")
      expect(page).to have_content("Average Yelp Rating: 4.5 Stars")

      click_on "Add a Family Friendly Review"

      expect(current_path).to eq(new_businesses_review_path)

      page.check("Ladies' Room Changing Table")
      page.check("Men's Room Changing Table")
      page.check("Kid's Menu")
      page.check("High Chairs/Booster Seats")
      page.check("Crayons, Coloring Pages, Other Waiting Area Activites")
      page.check("Nursing Area")
      page.check("Carseat Slings")
      page.check("Stroller Storage")
      page.check("Play Area")

      fill_in "Comments", with: "'The Queen of Hearts, she made some tarts, All on a summer day: The Knave of Hearts, he stole those tarts, And took them quite away!' 'Consider your verdict,' the King said to the jury. 'Not yet, not yet!' the Rabbit hastily interrupted. 'There's a great  deal to come before that!' 'Call the first witness,' said the King; and the White Rabbit blew three  blasts on the trumpet, and called out, 'First witness!' The first witness was the Hatter. He came in with a teacup in one  hand and a piece of bread-and-butter in the other."

      page.check("zero_one")
      page.check("one_two")
      page.check("two_three")
      page.check("three_four")
      page.check("five_and_up")

      choose('business_rating_4')

      click_on "Submit Review"

    end
  end
end
