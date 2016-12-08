class Pictogram < ApplicationRecord
  has_and_belongs_to_many :boards

  validates :name, presence: true
  validates :image, presence: true
end
