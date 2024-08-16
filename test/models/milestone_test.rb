# == Schema Information
#
# Table name: milestones
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  name        :string
#  start_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#
# Indexes
#
#  index_milestones_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
require "test_helper"

class MilestoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
