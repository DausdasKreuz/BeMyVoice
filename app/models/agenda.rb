class Agenda < ApplicationRecord
  belongs_to :disabled

  validates :name, presence: true
end
