class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.belongs_to :teacher, null: false
      t.string :title
      t.text :content
      t.integer :price
      t.string :published
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :courses, :slug, unique: true
  end
end
