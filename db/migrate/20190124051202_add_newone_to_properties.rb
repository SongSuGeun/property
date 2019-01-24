class AddNewoneToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :image, :text
    add_column :properties, :video, :string
    add_column :properties, :impressions_count, :integer , default: 0
  end
end
