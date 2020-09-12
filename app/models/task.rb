class Task < ApplicationRecord
  validates :name, length: { in: 3..90 }
  validates :detail, length: { in: 3..300 }
end
