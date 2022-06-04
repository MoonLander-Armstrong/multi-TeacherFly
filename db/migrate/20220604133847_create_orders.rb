class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :teacher, null: false
      t.string :name
      t.string :email
      t.integer :price
      t.string :slug
      t.string :status
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
    add_index :orders, :slug, unique: true
  end
end
