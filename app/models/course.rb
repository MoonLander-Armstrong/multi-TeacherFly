class Course < ApplicationRecord
  belongs_to_tenant :teacher
end
