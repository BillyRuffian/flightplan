module ProjectsHelper
  def iso_date_range(project)
    [ project.start_date.iso8601, project.end_date.iso8601 ]
  end
end
