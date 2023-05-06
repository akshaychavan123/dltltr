class SajalsController < ApplicationController 
  def index
    @sajal = Sajal.all
      if @sajal.present?
        render json:@sajal
      end
    end
  end