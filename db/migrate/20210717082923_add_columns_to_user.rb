class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :speciality, :string
  end
end
