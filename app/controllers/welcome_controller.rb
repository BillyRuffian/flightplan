class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @events =ApplicationRecord.connection.execute(<<-SQL)
      #{current_user.projects.timeline.to_sql}
      UNION
      #{current_user.milestones.timeline.to_sql}
      UNION
      #{current_user.reminders.timeline.to_sql}
      ORDER BY start_date
    SQL
  end
end
