class AddSuburbCoordsToSuburbs < ActiveRecord::Migration
  def change
    add_column :suburbs, :suburb_coords, :string
  end
end
