class AddAuthorsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author_firstname, :string, null: false
    add_column :books, :author_lastname, :string, null: false
  end
end
