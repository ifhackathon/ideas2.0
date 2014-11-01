class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = policy_scope(Project)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    authorize @project
  end

  # GET /projects/new
  def new
    authorize Project
    @project = current_user.projects.new
    @project.project_finance_costs.build
    @project.project_materials.build
    @project.project_people_times.build
  end

  # GET /projects/1/edit
  def edit
    authorize @project.includes(:estimates)
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        @project.project_finance_costs.build
        @project.project_materials.build
        @project.project_people_times.build
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name,
                                      :description,
                                      :status,
                                      :date_to,
                                      :place,
                                      :video,
                                      :user_id,
                                      :photo,
                                      project_finance_costs_attributes: [:id, :name, :money, :_destroy],
                                      project_materials_attributes: [:id, :name, :quantity, :measure, :_destroy],
                                      project_people_times_attributes: [:id, :name, :day, :_destroy])
    end
end
