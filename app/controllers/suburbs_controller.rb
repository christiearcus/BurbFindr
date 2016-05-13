
class SuburbsController < ApplicationController

  def index
    @suburbs = Suburb.all
  end

  def results

    # code for slider
    # @limits = params[:hidden].split(',')
    # @lowerLimit = @limits[0].to_i
    # @upperLimit = @limits[1].to_i
    # @@results = Suburb.selection(@lowerLimit, @upperLimit, params[:state])


    @@results = Suburb.selection(0, params[:max_price].to_i, params[:state])
  end

  def data

    # test = JSON.parse(@@results.suburb_coords)
    render json: @@results.to_json
  end

end
