class RemoveFieldNameFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :longitude, :float
    remove_column :properties, :latitude, :float
    remove_column :properties, :region, :string
  end
end
