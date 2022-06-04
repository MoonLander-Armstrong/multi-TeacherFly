class Read < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :student
end
