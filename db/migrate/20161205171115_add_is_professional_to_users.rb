class AddIsProfessionalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :professional, :boolean, default: true
  end
end
