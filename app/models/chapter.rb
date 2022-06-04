class Chapter < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :courses
end
