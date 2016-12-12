class RemoveBoardToPictograms < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pictograms, :board, index: true
  end
end
