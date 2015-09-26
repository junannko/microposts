class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :profile, :string
    add_column :users, :music, :string
  end
end
