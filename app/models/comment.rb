class Comment < ApplicationRecord
  # validates
  validates :content, presence: true

  # relationship
  belongs_to_tenant :teacher
  belongs_to :section
  belongs_to :course
  belongs_to :student
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :comments, foreign_key: :parent_id 

  def self.sort_comments(course)
    where(course: course).includes(:section, :user).order( section_id: :asc, course_id: :desc)
  end
end
