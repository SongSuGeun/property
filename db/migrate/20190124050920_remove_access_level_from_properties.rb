class RemoveAccessLevelFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :count, :integer
    remove_column :properties, :impressions_count, :integer
    remove_column :properties, :property_image, :text
    remove_column :properties, :video, :text
  end
end
