class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :teacher, null: false
      t.belongs_to :section, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.text :content
      t.integer :parent_id

      t.timestamps
    end
  end
end
