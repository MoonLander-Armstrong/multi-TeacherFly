class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.belongs_to :teacher, null: false
      t.belongs_to :chapter, null: false, foreign_key: true
      t.string :title
      t.string :publishd
      t.text :content
      t.string :slug

      t.timestamps
    end
    add_index :sections, :slug, unique: true
  end
end
