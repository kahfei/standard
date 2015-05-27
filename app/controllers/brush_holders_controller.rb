class BrushHoldersController < ApplicationController
  # GET /brush_holders
  # GET /brush_holders.xml
  def index
    @filterrific = initialize_filterrific(
      BrushHolder, 
      params[:filterrific],
      select_options: {
      sorted_by: BrushHolder.options_for_sorted_by,
      with_partnumber: BrushHolder.partnumbers_for_select,
      with_description: BrushHolder.descriptions_for_select,
      with_brush_holder_type: BrushHolder.brush_holder_types_for_select,
      with_material: BrushHolder.materials_for_select,
      with_drawing_norm: BrushHolder.drawing_norms_for_select,
      with_corresponding_carbon_brush: BrushHolder.corresponding_carbon_brushs_for_select,
      with_supplier: BrushHolder.suppliers_for_select,
      with_where_used_product: BrushHolder.where_used_products_for_select,
      with_where_used_plant: BrushHolder.where_used_plants_for_select,
      with_reason: BrushHolder.reasons_for_select
    }) or return
    @brush_holders = @filterrific.find.page(params[:page]) 
     respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /brush_holders/1
  # GET /brush_holders/1.xml
  def show
    @brush_holder = BrushHolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brush_holder }
    end
  end

  # GET /brush_holders/new
  # GET /brush_holders/new.xml
  def new
    @brush_holder = BrushHolder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brush_holder }
    end
  end

  # GET /brush_holders/1/edit
  def edit
    @brush_holder = BrushHolder.find(params[:id])
    @object = BrushHolder.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = BrushHolder.find(params[:id])
    render 'shared/correct'
  end

  # POST /brush_holders
  # POST /brush_holders.xml
  def create
    @brush_holder = BrushHolder.new(brush_holder_params)

    @brush_holder.uploaded_by_section = session[:user_section]
    @brush_holder.uploader_role = session[:user_role]
    @brush_holder.uploader_name = session[:user_name]
    @brush_holder.release_status = "pending"

    respond_to do |format|
      if @brush_holder.save
        format.html { redirect_to(@brush_holder, :notice => 'Brush holder was successfully created.') }
        format.xml  { render :xml => @brush_holder, :status => :created, :location => @brush_holder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brush_holder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brush_holders/1
  # PUT /brush_holders/1.xml
  def update
    @brush_holder = BrushHolder.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @brush_holder.release_status = "needs editing"
    else
      @brush_holder.release_status = "pending"
    end
    respond_to do |format|
      if @brush_holder.update_attributes(brush_holder_params)
        format.html { redirect_to(@brush_holder, :notice => 'Brush holder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brush_holder.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @brush_holder = BrushHolder.find(params[:id])
    @brush_holder.release_status = "approved draft"
    @brush_holder.save
    respond_to do |format|
      format.html { redirect_to(brush_holders_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @brush_holder = BrushHolder.find(params[:id])
    @brush_holder.release_status = "released"
    @brush_holder.save
    respond_to do |format|
      format.html { redirect_to(brush_holders_url) }
      format.xml  { head :ok }
    end
  end


   def block
    @brush_holder = BrushHolder.find(params[:id])
    @brush_holder.release_status = "block"
    @brush_holder.save
    respond_to do |format|
      format.html { redirect_to(brush_holders_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @brush_holder = BrushHolder.find(params[:id])
    @brush_holder.release_status = "released"
    @brush_holder.save
    respond_to do |format|
      format.html { redirect_to(brush_holders_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = BrushHolder.find(params[:id])
    render 'shared/needs_editing'
  end
  # DELETE /brush_holders/1
  # DELETE /brush_holders/1.xml
  def destroy
    @brush_holder = BrushHolder.find(params[:id])
    @brush_holder.destroy

    respond_to do |format|
      format.html { redirect_to(brush_holders_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_brush_holders] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_brush_holder
      @brush_holder = BrushHolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brush_holder_params
      params.require(:brush_holder).permit(:id, :partnumber, :description, :brush_holder_type, 
        :material, :drawing_norm, :corresponding_carbon_brush, :supplier, :where_used_product, 
        :where_used_plant, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_brush_holder_type, 
        :need_to_edit_material, :need_to_edit_drawing_norm, :need_to_edit_corresponding_carbon_brush, 
        :need_to_edit_supplier, :need_to_edit_where_used_product, :need_to_edit_where_used_plant,
        :reason, :need_to_edit_reason)
    end
