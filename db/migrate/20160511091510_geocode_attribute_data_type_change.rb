class GeocodeAttributeDataTypeChange < ActiveRecord::Migration
  def change

    change_table :products do |t|
      change_column :suburbs, :lat, :string
      change_column :suburbs, :long, :string
    end

  end
end
