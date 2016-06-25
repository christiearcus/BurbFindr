desc 'adds polygons to suburb'
  task :polygon => :environment do



# require 'pry'
require 'json'

file = File.read('suburbs.geojson')
data = JSON.parse(file)

# binding.pry

# @suburb_hash = {}

# suburb_arr.each do |sub_name|

# end


# @suburbs.each do |suburb|
#     data["features"].each do |suburb| sub_name
#       if suburb["properties"]["SUBURB"] == sub_name
#         @suburb_hash[sub_name] = data["features"][0]["geometry"]["coordinates"][0][0]
#       end
#     end
#   end
# end

@suburbs = Suburb.all


@suburbs.each do |suburb|
  data["features"].each do |suburb_geo|
    if suburb_geo["properties"]["SUBURB"] == suburb.suburb_name
      suburb.suburb_coords = suburb_geo["geometry"]["coordinates"][0][0]
    end
  end
end



# @suburb_arr = [ ["ADELAIDE", [[138.5820730040001, -34.915387702999965], [138.5824373380001, -34.915409747999945], [138.58275153300008, -34.91534769899994]] ],
# ["BOWDEN", [[138.5820730040001, -34.915387702999965], [138.5824373380001, -34.915409747999945], [138.58275153300008, -34.91534769899994]] ] ]


# def add_data_to_column suburb_arr
#   @suburbs = Suburb.all
#   @suburbs.each do |suburb|
# binding.pry
#     @suburb_arr.each do |element|
# binding.pry
#       if suburb.suburb_name == element[0]
#         suburb.suburb_coords = element
#       end
#     end
#   end
# end
# add_data_to_column @suburb_arr
#

end
