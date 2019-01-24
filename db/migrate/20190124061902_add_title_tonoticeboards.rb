class AddTitleTonoticeboards < ActiveRecord::Migration[5.1]
  def change
    add_column :noticeboards, :title, :string
  end
end