class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :disableds

  validates :name, presence: true
  validates :professional, inclusion: { in: [true, false] }
  # validates :professional, exclusion: { in: [nil] }
end
