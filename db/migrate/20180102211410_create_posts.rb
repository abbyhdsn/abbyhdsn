class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :views, default: 0
      t.references :user, foreign_key: true
      t.boolean :drafts

      t.timestamps
    end
  end
end
