class AddSlugToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :slug, :string
    add_index :bookmarks, :slug
  end
end
