class CreateDisableds < ActiveRecord::Migration[5.0]
  def change
    create_table :disableds do |t|
      t.string :name
      t.references :user, index: true
      t.references :guide, index: true

      t.timestamps
    end
  end
end
