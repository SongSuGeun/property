class CreateQuestionboards < ActiveRecord::Migration[5.1]
  def change
    create_table :questionboards do |t|
      t.integer :user_id
      t.string :name
      t.string :content
      t.string :reply
      t.timestamps
    end
  end
end
