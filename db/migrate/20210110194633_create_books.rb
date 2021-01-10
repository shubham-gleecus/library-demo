class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.belongs_to :author, foreign_key: true
      t.string :book_title
      t.timestamps
    end
  end
end
