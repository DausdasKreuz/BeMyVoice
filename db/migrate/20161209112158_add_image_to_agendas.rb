class AddImageToAgendas < ActiveRecord::Migration[5.0]
  def change
    add_column :agendas, :image, :string
  end
end
