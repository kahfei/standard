class CarbonBrushesController < ApplicationController
  # GET /carbon_brushes
  # GET /carbon_brushes.xml
  def index
    @filterrific = initialize_filterrific(
      CarbonBrush, 
      params[:filterrific],
      select_options: {
      sorted_by: CarbonBrush.options_for_sorted_by,
      with_partnumber: CarbonBrush.partnumbers_for_select,
      with_description: CarbonBrush.descriptions_for_select,
      with_components: CarbonBrush.componentss_for_select,
      with_cross_sec: CarbonBrush.cross_secs_for_select,
      with_length: CarbonBrush.lengths_for_select,
      with_wire_length_or_spring_free_length: CarbonBrush.wire_length_or_spring_free_lengths_for_select,
      with_radius_for_commutator_mm: CarbonBrush.radius_for_commutator_mms_for_select,
      with_cut_off: CarbonBrush.cut_offs_for_select,
      with_supplier: CarbonBrush.suppliers_for_select,
      with_drawing_norm: CarbonBrush.drawing_norms_for_select,
      with_where_used_product: CarbonBrush.where_used_products_for_select,
      with_where_used_plant: CarbonBrush.where_used_plants_for_select,
      with_remark: CarbonBrush.remarks_for_select,
      with_reason: CarbonBrush.remarks_for_select
    }) or return
    @carbon_brushes = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /carbon_brushes/1
  # GET /carbon_brushes/1.xml
  def show
    @carbon_brush = CarbonBrush.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carbon_brush }
    end
  end

  # GET /carbon_brushes/new
  # GET /carbon_brushes/new.xml
  def new
    @carbon_brush = CarbonBrush.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carbon_brush }
    end
  end

  # GET /carbon_brushes/1/edit
  def edit
    @carbon_brush = CarbonBrush.find(params[:id])
    @object = CarbonBrush.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = CarbonBrush.find(params[:id])
    render 'shared/correct'
  end

  # POST /carbon_brushes
  # POST /carbon_brushes.xml
  def create
    @carbon_brush = CarbonBrush.new(carbon_brush_params)

    @carbon_brush.uploaded_by_section = session[:user_section]
    @carbon_brush.uploader_role = session[:user_role]
    @carbon_brush.uploader_name = session[:user_name]
    @carbon_brush.release_status = "pending"

    respond_to do |format|
      if @carbon_brush.save
        format.html { redirect_to(@carbon_brush, :notice => 'Carbon brush was successfully created.') }
        format.xml  { render :xml => @carbon_brush, :status => :created, :location => @carbon_brush }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carbon_brush.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carbon_brushes/1
  # PUT /carbon_brushes/1.xml
  def update
    @carbon_brush = CarbonBrush.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @carbon_brush.release_status = "needs editing"
    else
      @carbon_brush.release_status = "pending"
    end
    respond_to do |format|
      if @carbon_brush.update_attributes(carbon_brush_params)
        format.html { redirect_to(@carbon_brush, :notice => 'Carbon brush was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carbon_brush.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @carbon_brush = CarbonBrush.find(params[:id])
    @carbon_brush.release_status = "approved draft"
    @carbon_brush.save
    respond_to do |format|
      format.html { redirect_to(carbon_brushs_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @carbon_brush = CarbonBrush.find(params[:id])
    @carbon_brush.release_status = "released"
    @carbon_brush.save
    respond_to do |format|
      format.html { redirect_to(carbon_brushs_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @carbon_brush = CarbonBrush.find(params[:id])
    @carbon_brush.release_status = "block"
    @carbon_brush.save
    respond_to do |format|
      format.html { redirect_to(carbon_brushs_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @carbon_brush = CarbonBrush.find(params[:id])
    @carbon_brush.release_status = "released"
    @carbon_brush.save
    respond_to do |format|
      format.html { redirect_to(carbon_brushs_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object= CarbonBrush.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /carbon_brushes/1
  # DELETE /carbon_brushes/1.xml
  def destroy
    @carbon_brush = CarbonBrush.find(params[:id])
    @carbon_brush.destroy

    respond_to do |format|
      format.html { redirect_to(carbon_brushes_url) }
      format.xml  { head :ok }
    end
  end
  def reset_filterrific
      # Clear session persistence
      session[:filterrific_carbon_brushes] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_carbon_brush
      @carbon_brush = CarbonBrush.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carbon_brush_params
      params.require(:carbon_brush).permit(:id, :partnumber, :description, :components, 
        :cross_sec, :length, :wire_length_or_spring_free_length, :radius_for_commutator_mm, 
        :cut_off, :supplier, :drawing_norm, :where_used_product, :where_used_plant, 
        :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_components, 
        :need_to_edit_cross_sec, :need_to_edit_length, :need_to_edit_wire_length_or_spring_free_length, 
        :need_to_edit_radius_for_commutator_mm, :need_to_edit_cut_off, :need_to_edit_supplier, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_remark, :need_to_edit_reason,
        :reason)

    end