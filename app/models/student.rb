class Student < ApplicationRecord
  include Slugable

  # devise setting
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # validates
  validates :username, length: { maximum: 20 }

  # relationship
  belongs_to_tenant :teacher
  has_many :comments
  has_many :reads
  has_many :orders
  has_many :bought_courses, through: :orders, source: :course
  has_many :to_reads, through: :reads, source: :section
  has_one_attached :avatar, dependent: :destroy

  # scope
  scope :ordered, -> { includes(:orders).order("orders.price DESC") }

  def bought?(course)
    orders.where(status: "paid").exists?(course_id: course.id)
  end
end
