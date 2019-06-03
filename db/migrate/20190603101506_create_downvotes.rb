class CreateDownvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.boolean :downvote
      t.references :book, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
