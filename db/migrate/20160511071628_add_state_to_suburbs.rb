class AddStateToSuburbs < ActiveRecord::Migration
  def change
    add_column :suburbs, :state, :string
  end
end
