class WashersController < ApplicationController
  before_action :set_washer, only: [:show, :edit, :update, :destroy]

  # GET /washers
  def index
    @filterrific = initialize_filterrific(
      Washer, 
      params[:filterrific],
      select_options: {
      sorted_by: Washer.options_for_sorted_by,
      with_partnumber: Washer.partnumbers_for_select,
      with_description: Washer.descriptions_for_select,
      with_washer_type: Washer.washer_types_for_select,
      with_inner_diameter: Washer.inner_diameters_for_select,
      with_outer_diameter: Washer.outer_diameters_for_select,
      with_thickness: Washer.thicknesss_for_select,
      with_hardness: Washer.hardnesss_for_select,
      with_coating: Washer.coatings_for_select,
      with_material: Washer.materials_for_select,
      with_drawing_number: Washer.drawing_numbers_for_select,
      with_original_plant: Washer.original_plants_for_select, 
      with_where_used_product: Washer.where_used_products_for_select,
      with_where_used_plant: Washer.where_used_plants_for_select,
      with_remark: Washer.remarks_for_select,
      with_reason: Washer.reasons_for_select
    }) or return
    @washers = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /washers/1
  def show
  end

  # GET /washers/new
  def new
    @washer = Washer.new
  end

  # GET /washers/1/edit
  def edit
    @object = Washer.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Washer.find(params[:id])
    render 'shared/correct'
  end

  # POST /washers
  def create
    @washer = Washer.new(washer_params)

    @washer.uploaded_by_section = session[:user_section]
    @washer.uploader_role = session[:user_role]
    @washer.uploader_name = session[:user_name]
    @washer.release_status = "pending"

    if @washer.save
      redirect_to @washer, notice: 'Washer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /washers/1
  def update
    @washer = Washer.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @washer.release_status = "needs editing"
    else
      @washer.release_status = "pending"
    end

    if @washer.update(washer_params)
      redirect_to @washer, notice: 'Washer was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @washer = Washer.find(params[:id])
    @washer.release_status = "approved draft"
    @washer.save
    respond_to do |format|
      format.html { redirect_to(washers_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @washer = Washer.find(params[:id])
    @washer.release_status = "released"
    @washer.save
    respond_to do |format|
      format.html { redirect_to(washers_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @washer = Washer.find(params[:id])
    @washer.release_status = "block"
    @washer.save
    respond_to do |format|
      format.html { redirect_to(washers_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @washer = Washer.find(params[:id])
    @washer.release_status = "released"
    @washer.save
    respond_to do |format|
      format.html { redirect_to(washers_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Washer.find(params[:id])
    render 'shared/needs_editing'
  end


  # DELETE /washers/1
  def destroy
    @washer.destroy
    redirect_to washers_url, notice: 'Washer was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_washers] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_washer
      @washer = Washer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def washer_params
      params.require(:washer).permit(:id, :partnumber, :description, :washer_type, :inner_diameter, 
        :outer_diameter, :thickness, :hardness, :coating, :material, :drawing_number, :original_plant, :where_used_product, 
        :where_used_plant, :remark, :release_status, 
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_washer_type, 
        :need_to_edit_inner_diameter, :need_to_edit_outer_diameter, :need_to_edit_thickness, :need_to_edit_hardness, 
        :need_to_edit_coating, :need_to_edit_material, :need_to_edit_drawing_number, 
        :need_to_edit_original_plant, :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_remark, :need_to_edit_reason, :reason)
    end
end
