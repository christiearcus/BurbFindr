class Suburb < ActiveRecord::Base

  def self.unit_sort(min_price, max_price)
    Suburb.where('median_price_unit < ? and median_price_unit > ?', min_price, max_price)
  end

  def self.house_sort(min_price, max_price)
    Suburb.where('median_price_house < ? and median_price_house > ?', min_price, max_price)
  end

  def self.selection(min_price, max_price)

    suburbs = Suburb.all
    sub_select_units = []
    sub_select_houses = []

    suburbs.each do |suburb|
      if suburb.median_price_unit < max_price
        if suburb.median_price_unit > min_price
          sub_select_units.push(suburb.suburb_name)
        end
      end
      if suburb.median_price_house < max_price
        if suburb.median_price_house > min_price
          sub_select_houses.push(suburb.suburb_name)
        end
      end
    end

    suburb_hash = {unit_afford_subs: sub_select_units, houses_afford_subs: sub_select_houses}
  end
end
