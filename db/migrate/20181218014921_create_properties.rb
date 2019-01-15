class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :user_id
      t.integer :rent
      t.integer :subsidy
      t.integer :reward
      t.integer :region
      t.integer :area
      t.integer :extent
      t.integer :count
      t.text :property_image
      t.text :video

      t.timestamps
    end
  end
end
