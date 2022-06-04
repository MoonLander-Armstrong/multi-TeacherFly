class AddLecturerIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :lecturer_id, :bigint, null: false, foreign_key: true
  end
end
