class Label < ApplicationRecord
  belongs_to :user
  validates :name, length: { in: 2..30 }
end
