class RemoveColFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :subsidy, :integer
    remove_column :properties, :reward, :integer
    remove_column :properties, :region, :integer
    remove_column :properties, :extent, :integer
  end
end
