class Student < ApplicationRecord
  include Slugable

  # devise setting
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # validates
  validates :username, length: { maximum: 20 }

  # relationship
  belongs_to_tenant :teacher
  has_one_attached :avatar, dependent: :destroy
end
