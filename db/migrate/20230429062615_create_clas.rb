class CreateClas < ActiveRecord::Migration[7.0]
  def change
    create_table :clas do |t|
      t.integer :std
      t.references :student

      t.timestamps
    end
  end
end
