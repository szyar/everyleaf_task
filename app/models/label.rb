class Label < ApplicationRecord
  belongs_to :user
  has_many :task_labels
  has_many :tasks, through: :task_labels
  validates :name, length: { in: 2..30 }
end
