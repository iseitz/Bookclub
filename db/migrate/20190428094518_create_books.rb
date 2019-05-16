class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
