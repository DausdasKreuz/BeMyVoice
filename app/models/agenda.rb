class Agenda < ApplicationRecord
  belongs_to :disabled
  has_many :boards

  validates :name, presence: true
  validates :image, presence: true
end
