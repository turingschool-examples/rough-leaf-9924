require "rails_helper"

RSpec.describe Customer
  describe "relationships" do
    it {should have_and_belong_to_many :items}
  end