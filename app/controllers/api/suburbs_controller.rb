

module Api
  class SuburbsController < ApplicationController

    def get_suburbs
      @suburbs = Suburb.all
      render json: @suburbs.to_json
    end

    def suburb_selection
      Suburb.selection(0, params[:max_price].to_i, params[:state])
      render json: suburb_hash.to_json, status: 200
    end
  end
end
