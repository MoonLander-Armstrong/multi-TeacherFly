class Enroll < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :student
  belongs_to :course
end
