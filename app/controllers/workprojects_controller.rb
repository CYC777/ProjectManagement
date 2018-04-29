class WorkprojectsController < ApplicationController
  before_action :set_workproject, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant
  # GET /workprojects
  # GET /workprojects.json
  def index
    @workprojects = Workproject.all
  end

  # GET /workprojects/1
  # GET /workprojects/1.json
  def show
  end

  # GET /workprojects/new
  def new
    @workproject = Workproject.new
  end

  # GET /workprojects/1/edit
  def edit
  end

  # POST /workprojects
  # POST /workprojects.json
  def create
    @workproject = Workproject.new(workproject_params)

    respond_to do |format|
      if @workproject.save
        format.html { redirect_to root_url, notice: 'Workproject was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /workprojects/1
  # PATCH/PUT /workprojects/1.json
  def update
    respond_to do |format|
      if @workproject.update(workproject_params)
        format.html { redirect_to root_url, notice: 'Workproject was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /workprojects/1
  # DELETE /workprojects/1.json
  def destroy
    @workproject.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Workproject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workproject
      @workproject = Workproject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workproject_params
      params.require(:workproject).permit(:title, :details, :expected_completion_date, :tenant_id)
    end
    
    def set_tenant 
      @tenant = Tenant.find(params[:tenant_id])
    end
    
    def verify_tenant
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
        redirect_to :root, 
        flash: {error: 'You are not authorized to access any organization other than your own'}
      end
    end
end
