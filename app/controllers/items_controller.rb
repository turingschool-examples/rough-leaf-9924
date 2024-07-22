class ItemsController < ApplicationController
  def index
    @items = Item.includes(:supermarket, :customers).all
  end
end