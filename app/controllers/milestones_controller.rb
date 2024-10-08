class MilestonesController < ApplicationController
  before_action :set_project
  before_action :set_milestone, only: %i[ show edit update destroy ]

  # # GET /milestones or /milestones.json
  # def index
  #   @milestones = Milestone.all
  # end

  # GET /milestones/1 or /milestones/1.json
  def show
  end

  # GET /milestones/new
  def new
    @milestone = @project.milestones.new(start_date: @project.start_date)
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones or /milestones.json
  def create
    @milestone = @project.milestones.new(milestone_params)

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to project_url(@project), notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1 or /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to project_url(@project), notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1 or /milestones/1.json
  def destroy
    @milestone.destroy!

    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_milestone
      @milestone = @project.milestones.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milestone_params
      params.require(:milestone).permit(:name, :start_date, :end_date, :project_id, :description)
    end
end
