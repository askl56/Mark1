class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :topics, :users
  end
end
