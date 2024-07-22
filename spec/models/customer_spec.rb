require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:items).through(:customers_items) }
end
