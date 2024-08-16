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
class Milestone < ApplicationRecord
  belongs_to :project, inverse_of: :milestones
end
