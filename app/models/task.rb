class Task < ApplicationRecord
  before_validation :add_default_detail

  validates :name, length: { in: 3..90 }
  validates :detail, length: { in: 3..300 }

  $statuses = ['Unstarted', 'In Progress', 'Completed']
  enum priority_type: { Low: 0, Medium: 1, High: 2 }

  scope :search, ->(search_name, search_status) {
    @name_param = search_name.to_s.downcase
    @status_param = search_status.to_s.downcase

    if @name_param.present? && @status_param.blank?
      where("lower(name) LIKE ?", "%#{@name_param}%")

    elsif @status_param.present? && @name_param.blank?
      where("lower(status) LIKE ?", "%#{@status_param}%")

    elsif @name_param.present? && @status_param.present?
      where("lower(name) LIKE ? AND lower(status) LIKE ?",
                                "%#{@name_param}%", "%#{@status_param}%")
    end
  }

  private
  def add_default_detail
    if detail.blank?
      self.detail = 'Default Detail'
    end
  end
end
