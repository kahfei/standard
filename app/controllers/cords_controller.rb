class CordsController < ApplicationController
  before_action :set_cord, only: [:show, :edit, :update, :destroy]

  # GET /cords
  def index
    @filterrific = initialize_filterrific(
      Cord, 
      params[:filterrific],
      select_options: {
      sorted_by: Cord.options_for_sorted_by,
      with_partnumber: Cord.partnumbers_for_select,
      with_description: Cord.descriptions_for_select,
      with_cord_mat: Cord.cord_mats_for_select,
      with_cord_type: Cord.cord_types_for_select,
      with_plug_type: Cord.plug_types_for_select,
      with_polarity: Cord.polaritys_for_select,
      with_cross_sec: Cord.cross_secs_for_select,
      with_cord_od: Cord.cord_ods_for_select,
      with_length: Cord.lengths_for_select,
      with_dismantled_length: Cord.dismantled_lengths_for_select,
      with_switch_con: Cord.switch_cons_for_select,
      with_drawing_norm: Cord.drawing_norms_for_select,
      with_where_used_product: Cord.where_used_products_for_select,
      with_where_used_plant: Cord.where_used_plants_for_select,
      with_cord_spec: Cord.cord_specs_for_select,
      with_remark: Cord.remarks_for_select,
      with_reason: Cord.reasons_for_select
    }) or return
    @cords = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /cords/1
  def show
    @cord = Cord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cord }
    end
  end

  # GET /cords/new
  def new
    @cord = Cord.new
  end

  # GET /cords/1/edit
  def edit
    @cord = Cord.find(params[:id])
    @object = Cord.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Cord.find(params[:id])
    render 'shared/correct'
  end

  # POST /cords
  def create
    @cord = Cord.new(cord_params)

    @cord.uploaded_by_section = session[:user_section]
    @cord.uploader_role = session[:user_role]
    @cord.uploader_name = session[:user_name]
    @cord.release_status = "pending"

    if @cord.save
      redirect_to @cord, notice: 'Cord was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cords/1
  def update
    @cord = Cord.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @cord.release_status = "needs editing"
    else
      @cord.release_status = "pending"
    end
    if @cord.update(cord_params)
      redirect_to @cord, notice: 'Cord was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @cord = Cord.find(params[:id])
    @cord.release_status = "approved draft"
    @cord.save
    respond_to do |format|
      format.html { redirect_to(cords_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @cord = Cord.find(params[:id])
    @cord.release_status = "released"
    @cord.save
    respond_to do |format|
      format.html { redirect_to(cords_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @cord = Cord.find(params[:id])
    @cord.release_status = "block"
    @cord.save
    respond_to do |format|
      format.html { redirect_to(cords_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @cord = Cord.find(params[:id])
    @cord.release_status = "released"
    @cord.save
    respond_to do |format|
      format.html { redirect_to(cords_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Cord.find(params[:id])
    render 'shared/needs_editing'
  end
  # DELETE /cords/1
  def destroy
    @cord.destroy
    redirect_to cords_url, notice: 'Cord was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_cords] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cord
      @cord = Cord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cord_params
      params.require(:cord).permit(:id, :partnumber, :description, :cord_mat, :cord_type, :plug_type, :polarity, 
        :cross_sec, :cord_od, :length, :dismantled_length, :switch_con, :drawing_norm, :where_used_product, 
        :where_used_plant, :cord_spec, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_cord_mat, :need_to_edit_cord_type, 
        :need_to_edit_plug_type, :need_to_edit_polarity, :need_to_edit_cross_sec, :need_to_edit_cord_od, 
        :need_to_edit_length, :need_to_edit_dismantled_length, :need_to_edit_switch_con, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_cord_spec, :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end
end
