class Lecturer < ApplicationRecord
  belongs_to_tenant :teacher
end
