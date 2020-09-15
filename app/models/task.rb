class Task < ApplicationRecord
  before_validation :add_default_detail

  validates :name, length: { in: 3..90 }
  validates :detail, length: { in: 3..300 }

  private
  def add_default_detail
    if detail.blank?
      self.detail = 'Default Detail'
    end
  end
end
