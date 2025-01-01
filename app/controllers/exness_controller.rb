class ExnessController < ApplicationController
  def index
    @trade = Trade.where(platform: "exness")
  end
end
