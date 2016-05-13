class Suburb < ActiveRecord::Base

  def self.unit_sort(min_price, max_price)
    Suburb.where('median_price_unit < ? and median_price_unit > ?', min_price, max_price)
  end

  def self.house_sort(min_price, max_price)
    Suburb.where('median_price_house < ? and median_price_house > ?', min_price, max_price)
  end

  def self.selection(min_price, max_price, state)

    suburbs = Suburb.all
    suburb_array = []

    suburbs.each do |suburb|

      if suburb.state == state
        if (suburb.median_price_unit < max_price && suburb.median_price_unit > min_price) || (suburb.median_price_house < max_price && suburb.median_price_house > min_price)
          suburb_array.push({suburbName: suburb.suburb_name, housePrice: suburb.median_price_house, unitPrice: suburb.median_price_house, lat: suburb.lat, long: suburb.long , state: suburb.state , suburb_coords: suburb.suburb_coords})
        end
      end

    end

    return suburb_array
  end

end
