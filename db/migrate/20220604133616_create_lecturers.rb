class CreateLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturers do |t|
      t.belongs_to :teacher, null: false
      t.string :name
      t.string :nickname
      t.text :content

      t.timestamps
    end
  end
end
