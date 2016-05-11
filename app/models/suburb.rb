class Suburb < ActiveRecord::Base

  def self.unit_sort(min_price, max_price)
    Suburb.where('median_price_unit < ? and median_price_unit > ?', min_price, max_price)
  end

  def self.house_sort(min_price, max_price)
    Suburb.where('median_price_house < ? and median_price_house > ?', min_price, max_price)
  end

  def self.selection(min_price, max_price)

    suburbs = Suburb.all
    suburb_array = []

    suburbs.each do |suburb|
      if (suburb.median_price_unit < max_price && suburb.median_price_unit > min_price) || (suburb.median_price_house < max_price && suburb.median_price_house > min_price)
        suburb_array.push({suburbName: suburb.suburb_name, housePrice: suburb.median_price_house, unitPrice: suburb.median_price_house, geocode: suburb.geocode, state: suburb.state })
      end
    end

    return suburb_array

  end

end
