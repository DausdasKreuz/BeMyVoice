class Disabled < ApplicationRecord
  belongs_to :professional, class_name: 'User'
  has_one :guide, class_name: 'User'
end
