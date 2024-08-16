# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  name        :string
#  start_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_projects_on_name     (name)
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date

  def end_date_after_start_date
    return unless end_date && start_date
    if end_date < start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end
end
