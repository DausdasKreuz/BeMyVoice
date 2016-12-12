class CreateBoardsPictograms < ActiveRecord::Migration[5.0]
  def change
    create_table :boards_pictograms do |t|
      t.belongs_to :board, index: true
      t.belongs_to :pictogram, index: true
    end
  end
end
