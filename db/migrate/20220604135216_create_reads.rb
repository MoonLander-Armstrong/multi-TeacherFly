class CreateReads < ActiveRecord::Migration[6.1]
  def change
    create_table :reads do |t|
      t.belongs_to :teacher, null: false
      t.boolean :finished
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :section
      t.bigint :course_id

      t.timestamps
    end
  end
end
