class Task < ApplicationRecord
  before_validation :add_default_detail

  validates :name, length: { in: 3..90 }
  validates :detail, length: { in: 3..300 }

  $statuses = ['Unstarted', 'In Progress', 'Completed']
  enum priority_type: { Low: 0, Medium: 1, High: 2 }

  private

  def add_default_detail
    if detail.blank?
      self.detail = 'Default Detail'
    end
  end
end
