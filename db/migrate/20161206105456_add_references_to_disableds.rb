class AddReferencesToDisableds < ActiveRecord::Migration[5.0]
  def change
    add_reference :disableds, :professional, references: :users
    add_reference :disableds, :guide, references: :users
  end
end
