class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @events =ApplicationRecord.connection.execute(<<-SQL)
      #{Project.timeline.to_sql}
      UNION
      #{Milestone.timeline.to_sql}
      UNION
      #{Reminder.timeline.to_sql}
      ORDER BY start_date
    SQL
  end
end
