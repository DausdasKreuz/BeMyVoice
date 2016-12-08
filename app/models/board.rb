class Board < ApplicationRecord
  belongs_to :agenda

  validates :name, presence: true
end
