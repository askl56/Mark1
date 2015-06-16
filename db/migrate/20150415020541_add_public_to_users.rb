class AddPublicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :public, :boolean, default: false
  end
end
