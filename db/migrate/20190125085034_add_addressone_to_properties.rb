class AddAddressoneToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :address, :string
  end
end
