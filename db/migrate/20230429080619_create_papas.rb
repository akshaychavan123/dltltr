class CreatePapas < ActiveRecord::Migration[7.0]
  def change
    create_table :papas do |t|
      t.string :name

      t.timestamps
    end
  end
end
