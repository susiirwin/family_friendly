class ReviewFormObject
  attr_reader :review, :amenities

  def initialize(review, amenities)
    @review = review
    @amenities = amenities
  end

  def business
    review.business
  end
end
