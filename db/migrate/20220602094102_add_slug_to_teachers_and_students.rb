class AddSlugToTeachersAndStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :slug, :string
    add_index :teachers, :slug, unique: true

    add_column :students, :slug, :string
    add_index :students, :slug, unique: true
  end
end
