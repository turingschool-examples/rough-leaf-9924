require "rails_helper"

RSpec.describe Customer
  describe "relationships" do
    it {should have_many :items}
    it {should belong_to :item}
  end