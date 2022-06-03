class Student < ApplicationRecord
  include Slugable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # relationship
  belongs_to_tenant :teacher
  has_one_attached :avatar, dependent: :destroy
end
