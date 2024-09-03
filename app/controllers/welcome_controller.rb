class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = (current_user.projects.timeline +
      current_user.milestones.timeline +
      current_user.reminders.timeline)
      .sort_by(&:start_date)
      .group_by_week(&:start_date)
  end
end
