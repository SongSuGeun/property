class AddNewoneToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :subsidy, :string
    add_column :properties, :reward, :string
    add_column :properties, :region, :string
    add_column :properties, :extent, :string
  end
end
