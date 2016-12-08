class Board < ApplicationRecord
  belongs_to :agenda
  has_many :pictograms

  validates :name, presence: true
end
