class CreateMunnas < ActiveRecord::Migration[7.0]
  def change
    create_table :munnas do |t|
      t.string :name
      t.integer :age
      t.string :role

      t.timestamps
    end
  end
end
