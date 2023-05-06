class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :comment
      t.string :reply
      t.references :sajal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
