class HomeController < ApplicationController
  def index
    params[:visible] = true
  end
end
