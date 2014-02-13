class MaintenanceReportsController < ApplicationController
  before_action :set_maintenance_report, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /maintenance_reports
  # GET /maintenance_reports.json
  def index
    @maintenance_reports = MaintenanceReport.all
  end

  # GET /maintenance_reports/1
  # GET /maintenance_reports/1.json
  def show
  end

  # GET /maintenance_reports/new
  def new
    @maintenance_report = MaintenanceReport.new
  end

  # GET /maintenance_reports/1/edit
  def edit
  end

  # POST /maintenance_reports
  # POST /maintenance_reports.json
  def create
    create_maintenance_report
    respond_to do |format|
      if @maintenance_report.save
        format.html { redirect_to user_home_path, notice: 'Maintenance report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @maintenance_report }
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_reports/1
  # PATCH/PUT /maintenance_reports/1.json
  def update
    respond_to do |format|
      if @maintenance_report.update(maintenance_report_params)
        format.html { redirect_to @maintenance_report, notice: 'Maintenance report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_reports/1
  # DELETE /maintenance_reports/1.json
  def destroy
    @maintenance_report.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_report
      @maintenance_report = MaintenanceReport.find(params[:id])
    end

    def create_maintenance_report
      @maintenance_report = MaintenanceReport.new
      bike = Bike.find_by_bike_id(maintenance_report_params[:bike_id])
      @maintenance_report.bike_id = bike
      @maintenance_report.user_id = current_user
      @maintenance_report.report  = maintenance_report_params[:report]
      @maintenance_report.problem_before_maintenance = bike.problem_description
      @maintenance_report.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_report_params
      params.require(:maintenance_report).permit(:bike_id, :report)
    end
end
