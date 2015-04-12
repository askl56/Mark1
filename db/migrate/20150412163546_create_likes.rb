class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :bookmark, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :bookmarks
  end
end
