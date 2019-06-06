class AddAgeGroupToBooks < ActiveRecord::Migration[5.2]
  def change
      add_reference :books, :age_group, foreign_key: true
  end
end
