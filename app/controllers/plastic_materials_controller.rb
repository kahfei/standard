class PlasticMaterialsController < ApplicationController
  before_action :set_plastic_material, only: [:show, :edit, :update, :destroy]

  # GET /plastic_materials
  def index
    @filterrific = initialize_filterrific(
      PlasticMaterial, 
      params[:filterrific],
      select_options: {
      sorted_by: PlasticMaterial.options_for_sorted_by,
      with_partnumber: PlasticMaterial.partnumbers_for_select,
      with_resin: PlasticMaterial.resins_for_select,
      with_color: PlasticMaterial.colors_for_select,
      with_supplier: PlasticMaterial.suppliers_for_select,
      with_recommendation: PlasticMaterial.recommendations_for_select,
      with_ul_number: PlasticMaterial.ul_numbers_for_select,
      with_drawing_norm: PlasticMaterial.drawing_norms_for_select,
      with_where_used_product: PlasticMaterial.where_used_products_for_select,
      with_where_used_plant: PlasticMaterial.where_used_plants_for_select,
      with_supplier_material_info: PlasticMaterial.supplier_material_infos_for_select,
      with_related_molders: PlasticMaterial.related_molderss_for_select,
      with_reason: PlasticMaterial.reason_for_select
    }) or return
    @plastic_materials = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /plastic_materials/1
  def show
  end

  # GET /plastic_materials/new
  def new
    @plastic_material = PlasticMaterial.new
  end

  # GET /plastic_materials/1/edit
  def edit
    @object = PlasticMaterial.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = PlasticMaterial.find(params[:id])
    render 'shared/correct'
  end

  # POST /plastic_materials
  def create
    @plastic_material = PlasticMaterial.new(plastic_material_params)

    @plastic_material.uploaded_by_section = session[:user_section]
    @plastic_material.uploader_role = session[:user_role]
    @plastic_material.uploader_name = session[:user_name]
    @plastic_material.release_status = "pending"

    if @plastic_material.save
      redirect_to @plastic_material, notice: 'Plastic material was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plastic_materials/1
  def update
    @plastic_material = PlasticMaterial.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @plastic_material.release_status = "needs editing"
    else
      @plastic_material.release_status = "pending"
    end
    if @plastic_material.update(plastic_material_params)
      redirect_to @plastic_material, notice: 'Plastic material was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @plastic_material = PlasticMaterial.find(params[:id])
    @plastic_material.release_status = "approved draft"
    @plastic_material.save
    respond_to do |format|
      format.html { redirect_to(plastic_materials_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @plastic_material = PlasticMaterial.find(params[:id])
    @plastic_material.release_status = "released"
    @plastic_material.save
    respond_to do |format|
      format.html { redirect_to(plastic_materials_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @plastic_material = PlasticMaterial.find(params[:id])
    @plastic_material.release_status = "block"
    @plastic_material.save
    respond_to do |format|
      format.html { redirect_to(plastic_materials_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @plastic_material = PlasticMaterial.find(params[:id])
    @plastic_material.release_status = "released"
    @plastic_material.save
    respond_to do |format|
      format.html { redirect_to(plastic_materials_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = PlasticMaterial.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /plastic_materials/1
  def destroy
    @plastic_material.destroy
    redirect_to plastic_materials_url, notice: 'Plastic material was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_plastic_materials] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plastic_material
      @plastic_material = PlasticMaterial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plastic_material_params
      params.require(:plastic_material).permit(:id, :partnumber, :resin, :color, :supplier, 
        :recommendation, :ul_number, :drawing_norm, :where_used_product, :where_used_plant, 
        :supplier_material_info, :related_molders, :release_status,
        :need_to_edit_partnumber, :need_to_edit_resin, :need_to_edit_color, :need_to_edit_supplier, 
        :need_to_edit_recommendation, :need_to_edit_ul_number, :need_to_edit_drawing_norm, 
        :need_to_edit_where_used_product, :need_to_edit_supplier_material_info, :need_to_edit_related_molders,
        :reason, :need_to_edit_where_used_plant,:need_to_edit_reason)
    end
end
