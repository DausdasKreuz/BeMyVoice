class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.references :agenda, foreign_key: true

      t.timestamps
    end
  end
end
