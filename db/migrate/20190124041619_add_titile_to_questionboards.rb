class AddTitileToQuestionboards < ActiveRecord::Migration[5.1]
  def change
    
    add_column :questionboards, :title, :string

  end
end
