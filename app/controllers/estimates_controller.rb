class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create, :help]
  before_action :set_estimatable, only: [:new, :create]

  # GET /estimates
  # GET /estimates.json
  def index
    @estimates = Estimate.all
  end

  def help
    authorize @project, :estimate_new?
    @estimate = Estimate.new
  end

  # GET /estimates/1
  # GET /estimates/1.json
  def show
  end

  # GET /estimates/new
  def new
    authorize @project, :estimate_new?
    @estimate = Estimate.new
  end

  # GET /estimates/1/edit
  def edit
  end

  # POST /estimates
  # POST /estimates.json
  def create
    authorize @project, :estimate_new?
    
    if estimate_params[:estimateble_id].present?
      params[:id], params[:type] = estimate_params[:estimateble_id].split('-')
      set_estimatable
    end

    create_estimate(estimate_params)
    success = false
    @estimate.transaction do
      success = @estimate.save
      success = @estimateble.save && success
    end
    respond_to do |format|
      if success
        format.html { redirect_to @project, notice: 'Estimate was successfully created.' }
        format.json { render :show, status: :created, location: @estimate }
      else
        format.html { render :new }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimates/1
  # PATCH/PUT /estimates/1.json
  def update
    respond_to do |format|
      if @estimate.update(estimate_params)
        format.html { redirect_to @estimate, notice: 'Estimate was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimate }
      else
        format.html { render :edit }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimates/1
  # DELETE /estimates/1.json
  def destroy
    @estimate.destroy
    respond_to do |format|
      format.html { redirect_to estimates_url, notice: 'Estimate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_estimatable
      case params[:type]
        when 'fc'
          @estimateble = ProjectFinanceCost.find(params[:id])
        when 'pm'
          @estimateble = ProjectMaterial.find(params[:id])
        when 'ppt'
          @estimateble = ProjectPeopleTime.find(params[:id])
      end
    end
    def create_estimate(estimate_params)
      @estimate = Estimate.new(estimate_params)
      @estimate.user = current_user
      @estimate.project = @project
      if @estimateble.present?
        @estimate.estimateble = @estimateble
        @estimateble.total = @estimateble.total + estimate_params[:value].to_f
      end

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def estimate_params
      params.require(:estimate).permit(:value, :estimateble_id)
    end
end
