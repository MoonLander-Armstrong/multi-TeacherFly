class AddDomainAndSubdomainToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :domain, :string
    add_column :teachers, :subdomain, :string
  end
end
