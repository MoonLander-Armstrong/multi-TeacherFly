class Order < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :course
  belongs_to :user
end
