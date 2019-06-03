class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.boolean :upvote 
      t.references :book, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
