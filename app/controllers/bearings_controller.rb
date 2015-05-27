class BearingsController < ApplicationController
  # GET /bearings
  # GET /bearings.xml
  def index
 
    @filterrific = initialize_filterrific(
      Bearing,
      params[:filterrific],
      select_options: {
        sorted_by: Bearing.options_for_sorted_by,
        with_partnumber: Bearing.partnumbers_for_select,
        with_description: Bearing.descriptions_for_select,
        with_i_dia: Bearing.i_dias_for_select,
        with_o_dia: Bearing.o_dias_for_select,
        with_width: Bearing.widths_for_select,
        with_bearing_type: Bearing.bearing_types_for_select,
        with_bearing_no: Bearing.bearing_nos_for_select,
        with_radial_clearance_um: Bearing.radial_clearance_ums_for_select,
        with_sealing: Bearing.sealings_for_select,
        with_max_speed_rpm: Bearing.max_speed_rpms_for_select,
        with_position_within_product: Bearing.position_within_products_for_select,
        with_drawing_norm: Bearing.drawing_norms_for_select,
        with_where_used_product: Bearing.where_used_products_for_select,
        with_where_used_plant: Bearing.where_used_plants_for_select,
        with_supplier: Bearing.suppliers_for_select,
        with_remark: Bearing.remarks_for_select,
        with_reason: Bearing.reasons_for_select, 
      }
      ) or return
      @bearings = @filterrific.find.page(params[:page])
      # session[:filterrific_bearings] = @filterrific.to_hash
      respond_to do |format|
        format.html
        format.js
      end
    
  end

  # rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific
      
  # GET /bearings/1
  # GET /bearings/1.xml
  def show
    @bearing = Bearing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bearing }
    end
  end

  # GET /bearings/new
  # GET /bearings/new.xml
  def new
    @bearing = Bearing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bearing }
    end
  end

  # GET /bearings/1/edit
  def edit
    @bearing = Bearing.find(params[:id])
    @object = Bearing.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Bearing.find(params[:id])
    render 'shared/correct'
  end

  # POST /bearings
  # POST /bearings.xml
  def create
    @bearing = Bearing.new(bearing_params)

    @bearing.uploaded_by_section = session[:user_section]
    @bearing.uploader_role = session[:user_role]
    @bearing.uploader_name = session[:user_name]
    @bearing.release_status = "pending"

    respond_to do |format|
      if @bearing.save
        format.html { redirect_to(@bearing, :notice => 'Bearing was successfully created.') }
        format.xml  { render :xml => @bearing, :status => :created, :location => @bearing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bearing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bearings/1
  # PUT /bearings/1.xml
  def update
    @bearing = Bearing.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @bearing.release_status = "needs editing"
    else
      @bearing.release_status = "pending"
    end
    respond_to do |format|
      if @bearing.update_attributes(bearing_params)
        format.html { redirect_to(@bearing, :notice => 'Bearing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bearing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @bearing = Bearing.find(params[:id])
    @bearing.release_status = "approved draft"
    @bearing.save
    respond_to do |format|
      format.html { redirect_to(bearings_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @bearing = Bearing.find(params[:id])
    @bearing.release_status = "released"
    @bearing.save
    respond_to do |format|
      format.html { redirect_to(bearings_url) }
      format.xml  { head :ok }
    end
  end

   def block
    @bearing = Bearing.find(params[:id])
    @bearing.release_status = "block"
    @bearing.save
    respond_to do |format|
      format.html { redirect_to(bearings_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @bearing = Bearing.find(params[:id])
    @bearing.release_status = "released"
    @bearing.save
    respond_to do |format|
      format.html { redirect_to(bearings_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Bearing.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /bearings/1
  # DELETE /bearings/1.xml
  def destroy
    @bearing = Bearing.find(params[:id])
    @bearing.destroy

    respond_to do |format|
      format.html { redirect_to(bearings_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_bearings] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_bearing
      @bearing = Bearing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bearing_params
      params.require(:bearing).permit(:id, :partnumber, :description, :i_dia, :o_dia, :width, 
        :bearing_type, :bearing_no, :radial_clearance_um, :sealing, :max_speed_rpm, 
        :position_within_product, :drawing_norm, :where_used_product, :where_used_plant, 
        :supplier, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_i_dia, 
        :need_to_edit_o_dia, :need_to_edit_width, :need_to_edit_bearing_type, 
        :need_to_edit_bearing_no, :need_to_edit_radial_clearance_um, :need_to_edit_sealing, 
        :need_to_edit_max_speed_rpm, :need_to_edit_position_within_product, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_supplier, :need_to_edit_remark,:need_to_edit_reason,
        :reason)
    end