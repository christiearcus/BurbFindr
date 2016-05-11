class AddLatToSuburbs < ActiveRecord::Migration
  def change
    add_column :suburbs, :lat, :integer
    add_column :suburbs, :long, :integer
  end
end
