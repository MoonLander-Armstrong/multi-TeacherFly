class Section < ApplicationRecord
  include Slugable

  # validates
  validates :title,
            presence: true,
            length: {
              maximum: 30
            }

  # relationship
  belongs_to_tenant :teacher
  belongs_to :chapter
  has_one :course, through: :chapter
  has_many :comments, dependent: :destroy
  has_many :reads
  has_many :readers, through: :reads, source: :user
  has_one_attached :media, dependent: :destroy

  scope :published, -> { where(published: "publish") }
  scope :draft, -> { where(published: "draft") }

  def self.published_state
    [
      %w[
        草稿 draft
      ],
      %w[
        發布 publish
      ]
    ]
  end

  def prev_section
    if chapter.sections.where(["id < ? and published = ?", id, "publish"]).present?
      chapter.sections.where(["id < ? and published = ?", id, "publish"]).last
    else
      chapter.prev_chapter.sections.published.last
    end
  end

  def next_section
    if chapter.sections.where(["id > ? and published = ?", id, "publish"]).present?
      chapter.sections.where(["id > ? and published = ?", id, "publish"]).first
    else
      chapter.next_chapter.sections.published.first
    end
  end
end
