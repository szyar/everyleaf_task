class Task < ApplicationRecord
  validates :name, length: { in: 3..30 }
  validates :detail, length: { in: 3..300 }
end
