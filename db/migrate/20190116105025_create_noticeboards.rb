class CreateNoticeboards < ActiveRecord::Migration[5.1]
  def change
    create_table :noticeboards do |t|
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
