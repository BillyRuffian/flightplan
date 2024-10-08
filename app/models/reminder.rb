# == Schema Information
#
# Table name: reminders
#
#  id         :integer          not null, primary key
#  name       :string
#  notified   :boolean          default(FALSE), not null
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#
# Indexes
#
#  index_reminders_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Reminder < ApplicationRecord
  include Eventable

  belongs_to :project, inverse_of: :reminders

  validates :name, presence: true
  validates :start_date, presence: true
end
