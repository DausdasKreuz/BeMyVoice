class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :assisted_disableds, class_name: 'Disabled', foreign_key: 'professional_id'

  has_one  :guided_disabled, class_name: 'Disabled', foreign_key: 'guide_id'

  validates :name, presence: true
  validates :professional, inclusion: { in: [true, false] }
  # validates :professional, exclusion: { in: [nil] }
end
