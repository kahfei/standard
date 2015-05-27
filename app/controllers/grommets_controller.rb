class GrommetsController < ApplicationController
  before_action :set_grommet, only: [:show, :edit, :update, :destroy]

  # GET /grommets
  def index
    @filterrific = initialize_filterrific(
      Grommet, 
      params[:filterrific],
      select_options: {
      sorted_by: Grommet.options_for_sorted_by,
      with_partnumber: Grommet.partnumbers_for_select,
      with_description: Grommet.descriptions_for_select,
      with_inner_hole_diameter: Grommet.inner_hole_diameters_for_select,
      with_grommet_type: Grommet.grommet_types_for_select,
      with_length: Grommet.lengths_for_select,
      with_for_cord_od: Grommet.for_cord_ods_for_select,
      with_material: Grommet.materials_for_select,
      with_drawing_norm: Grommet.drawing_norms_for_select,
      with_where_used_product: Grommet.where_used_products_for_select,
      with_where_used_plant: Grommet.where_used_plants_for_select,
      with_remark: Grommet.remarks_for_select,
      with_reason: Grommet.reasons_for_select
    }) or return
    @grommets = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /grommets/1
  def show
  end

  # GET /grommets/new
  def new
    @grommet = Grommet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grommet }
    end
  end

  # GET /grommets/1/edit
  def edit
    @grommet = Grommet.find(params[:id])
    @object = Grommet.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Grommet.find(params[:id])
    render 'shared/correct'
  end

  # POST /grommets
  def create
    @grommet = Grommet.new(grommet_params)

    @grommet.uploaded_by_section = session[:user_section]
    @grommet.uploader_role = session[:user_role]
    @grommet.uploader_name = session[:user_name]
    @grommet.release_status = "pending"

    if @grommet.save
      redirect_to @grommet, notice: 'Grommet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grommets/1
  def update
    @grommet = Grommet.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @grommet.release_status = "needs editing"
    else
      @grommet.release_status = "pending"
    end
    if @grommet.update(grommet_params)
      redirect_to @grommet, notice: 'Grommet was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @grommet = Grommet.find(params[:id])
    @grommet.release_status = "approved draft"
    @grommet.save
    respond_to do |format|
      format.html { redirect_to(grommets_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @grommet = Grommet.find(params[:id])
    @grommet.release_status = "released"
    @grommet.save
    respond_to do |format|
      format.html { redirect_to(grommets_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @grommet = Grommet.find(params[:id])
    @grommet.release_status = "block"
    @grommet.save
    respond_to do |format|
      format.html { redirect_to(grommets_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @grommet = Grommet.find(params[:id])
    @grommet.release_status = "released"
    @grommet.save
    respond_to do |format|
      format.html { redirect_to(grommets_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Grommet.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /grommets/1
  def destroy
    @grommet.destroy
    redirect_to grommets_url, notice: 'Grommet was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_grommets] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grommet
      @grommet = Grommet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grommet_params
      params.require(:grommet).permit(:id, :partnumber, :description, :inner_hole_diameter, 
        :grommet_type, :length, :for_cord_od, :material, :drawing_norm, :where_used_product, 
        :where_used_plant, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_inner_hole_diameter, 
        :need_to_edit_grommet_type, :need_to_edit_length, :need_to_edit_for_cord_od, 
        :need_to_edit_material, :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end
end
