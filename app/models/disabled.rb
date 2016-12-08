class Disabled < ApplicationRecord
  belongs_to :professional, class_name: 'User' #, foreign_key: 'professional'
  belongs_to :guide, class_name: 'User' # , foreign_key: 'guide'
  has_many :agendas

  validates :name, presence: true
end
