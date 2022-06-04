class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :teacher, null: false
      t.belongs_to :course, null: false, foreign_key: true
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :chapters, :slug, unique: true
  end
end
