class AddOmniauthToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :provider, :string
    add_column :teachers, :uid, :string
  end
end
