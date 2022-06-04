class Course < ApplicationRecord
  include Slugable

  # validates
  validates :title, presence: true
  validates :price, presence: true, numericality: { less_than: 99999999 }
  validates :published, presence: true
  validates :description, length: { maximum: 50 }
  validates :lecturer, presence: true

  # relationship
  belongs_to_tenant :teacher
  belongs_to :lecturer
  has_one_attached :image, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :sections, through: :chapters
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :buyers, through: :orders, source: :user

  # scope
  scope :published, -> { where(published: "publish") }
  scope :draft, -> { where(published: "draft") }

  # callbacks
  after_find do |course|
    course.price ||= 0
  end

  def all_published_sections
    sections.published
  end

  def self.search(search)
    if search
      where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
