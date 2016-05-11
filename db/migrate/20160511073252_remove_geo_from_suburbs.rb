class RemoveGeoFromSuburbs < ActiveRecord::Migration
  def change
    remove_column :suburbs, :geocode, :string
  end
end
