class CreateAgeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :age_groups do |t|
      t.string :group, null: false

      t.timestamps null: false
    end
    add_index :age_groups, :group, unique: true
  end
end
