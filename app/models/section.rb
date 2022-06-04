class Section < ApplicationRecord
  belongs_to_tenant :teacher
  belongs_to :chapter
end
