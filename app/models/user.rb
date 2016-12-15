class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:professional, :guide]

  has_many  :assisted_disableds, class_name: 'Disabled', foreign_key: 'professional_id'
  has_one  :guided_disabled, class_name: 'Disabled', foreign_key: 'guide_id'

  validates :name, presence: true
end
