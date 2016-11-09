require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do
    it { should belong_to :user }
    it { should belong_to :business }
  end
end
