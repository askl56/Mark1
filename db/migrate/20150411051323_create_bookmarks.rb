class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookmarks, :topics
  end
end
