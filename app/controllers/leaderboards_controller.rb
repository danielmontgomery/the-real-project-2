class LeaderboardsController < ApplicationController
  def index
  	@posts = Picture.all.order(:score).reverse_order
  end
end
