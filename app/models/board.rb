class Board < ApplicationRecord
  belongs_to :agenda
  has_and_belongs_to_many :pictograms

  validates :name, presence: true
  validates :image, presence: true
end
