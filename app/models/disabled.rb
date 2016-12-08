class Disabled < ApplicationRecord
  belongs_to :professional, class_name: 'User'#, foreign_key: 'professional_id'
  has_one :guide, class_name: 'User'#, foreign_key: 'guide_id'
  has_many :agendas

  validates :name, presence: true
end
