class RemoveProfessionalToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :professional, :boolean, default: true
  end
end
