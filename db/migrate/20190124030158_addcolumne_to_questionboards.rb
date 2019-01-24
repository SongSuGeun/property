class AddcolumneToQuestionboards < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :latitude, :float
  end
end
