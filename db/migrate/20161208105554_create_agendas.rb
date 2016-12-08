class CreateAgendas < ActiveRecord::Migration[5.0]
  def change
    create_table :agendas do |t|
      t.string :name
      t.references :disabled, foreign_key: true

      t.timestamps
    end
  end
end
