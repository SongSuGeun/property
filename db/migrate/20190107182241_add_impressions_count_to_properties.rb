class AddImpressionsCountToProperties < ActiveRecord::Migration[5.1]
  
  def change
    add_column :properties, :impressions_count, :int
  end
end
