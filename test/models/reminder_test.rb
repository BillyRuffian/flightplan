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
require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
