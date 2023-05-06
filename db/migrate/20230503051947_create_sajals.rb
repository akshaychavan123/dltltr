class CreateSajals < ActiveRecord::Migration[7.0]
  def change
    create_table :sajals do |t|
      t.string :name
      t.integer :age
      t.string :doj

      t.timestamps
    end
  end
end
