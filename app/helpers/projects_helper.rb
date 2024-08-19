module ProjectsHelper
  def iso_date_range(project)
    [ project.start_date.iso8601, project.end_date.iso8601 ]
  end

  def percentage_of_project_complete(project)
    today = Date.today
    return 0 if today < project.start_date

    total_days = project.end_date - project.start_date
    days_passed = today - project.start_date
    percentage = (days_passed / total_days.to_f) * 100
    percentage = 100 if percentage > 100
    percentage
  end

  def activity_class(activity)
    if activity.start_date < Date.today
      'table-secondary'
    elsif activity.start_date == Date.today
      'table-success'
    else
      nil
    end
  end
end
