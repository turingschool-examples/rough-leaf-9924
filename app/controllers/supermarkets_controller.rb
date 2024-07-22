class SupermarketsController < ApplicationController
  def show
    @supermarkets = Supermarket.find(params[:id])
  end
end