class RunwaysController < ApplicationController
  def index
    @projects = current_user.projects.all.order(:start_date)
  end
end
