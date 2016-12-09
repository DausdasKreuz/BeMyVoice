class AddImageToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :image, :string
  end
end
