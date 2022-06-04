class Order < ApplicationRecord
  include AASM
  include Slugable

  aasm column: "status" do
    state :pending, initial: true
    state :paid

    event :pay do
      transitions from: :pending, to: :paid
    end
  end

  # relationship
  belongs_to_tenant :teacher
  belongs_to :course
  belongs_to :student

  # scopes
  scope :bought_course, ->(course) { where(["status = ? and course_id = ?", "paid", course]) }

  # callbacks
  after_update :add_user_to_reads, :add_teacher_to_user, if: :paid?

  def add_user_to_reads
    user.to_reads << course.all_published_sections
  end

  def add_teacher_to_user
    user.update(teacher: course.user)
  end

  def self.time_select(time)
    where('created_at >= ?', (time.to_i).days.ago)
  end
end
