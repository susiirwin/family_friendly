require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should belong_to :user }
end
