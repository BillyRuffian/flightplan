# == Schema Information
#
# Table name: reminders
#
#  id         :integer          not null, primary key
#  start_date :date
#  topic      :text
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
  belongs_to :project, inverse_of: :reminders
end
