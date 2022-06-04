class Comment < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :section
  belongs_to :user
  belongs_to :course
end
