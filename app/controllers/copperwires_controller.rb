class CopperwiresController < ApplicationController
  # GET /copperwires
  # GET /copperwires.xml
  def index
    @filterrific = initialize_filterrific(
      Copperwire, 
      params[:filterrific],
      select_options: {
      sorted_by: Copperwire.options_for_sorted_by,
      with_partnumber: Copperwire.partnumbers_for_select,
      with_description: Copperwire.descriptions_for_select,
      with_copperwire_type: Copperwire.copperwire_types_for_select,
      with_self_bonded: Copperwire.self_bondeds_for_select,
      with_diameter: Copperwire.diameters_for_select,
      with_drawing_norm: Copperwire.drawing_norms_for_select,
      with_supplier: Copperwire.suppliers_for_select,
      with_where_used_product: Copperwire.where_used_products_for_select,
      with_where_used_plant: Copperwire.where_used_plants_for_select,
      with_reason: Copperwire.reasons_for_select,
    }) or return
    @copperwires = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /copperwires/1
  # GET /copperwires/1.xml
  def show
    @copperwire = Copperwire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @copperwire }
    end
  end

  # GET /copperwires/new
  # GET /copperwires/new.xml
  def new
    @copperwire = Copperwire.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @copperwire }
    end
  end

  # GET /copperwires/1/edit
  def edit
    @copperwire = Copperwire.find(params[:id])
    @object = Copperwire.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Copperwire.find(params[:id])
    render 'shared/correct'
  end

  # POST /copperwires
  # POST /copperwires.xml
  def create
    @copperwire = Copperwire.new(copperwire_params)

    @copperwire.uploaded_by_section = session[:user_section]
    @copperwire.uploader_role = session[:user_role]
    @copperwire.uploader_name = session[:user_name]
    @copperwire.release_status = "pending"

    respond_to do |format|
      if @copperwire.save
        format.html { redirect_to(@copperwire, :notice => 'Copperwire was successfully created.') }
        format.xml  { render :xml => @copperwire, :status => :created, :location => @copperwire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @copperwire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /copperwires/1
  # PUT /copperwires/1.xml
  def update
    @copperwire = Copperwire.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @copperwire.release_status = "needs editing"
    else
      @copperwire.release_status = "pending"
    end
    respond_to do |format|
      if @copperwire.update_attributes(copperwire_params)
        format.html { redirect_to(@copperwire, :notice => 'Copperwire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @copperwire.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @copperwire = Copperwire.find(params[:id])
    @copperwire.release_status = "approved draft"
    @copperwire.save
    respond_to do |format|
      format.html { redirect_to(copperwires_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @copperwire = Copperwire.find(params[:id])
    @copperwire.release_status = "released"
    @copperwire.save
    respond_to do |format|
      format.html { redirect_to(copperwires_url) }
      format.xml  { head :ok }
    end
  end

   def block
    @copperwire = Copperwire.find(params[:id])
    @copperwire.release_status = "block"
    @copperwire.save
    respond_to do |format|
      format.html { redirect_to(copperwires_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @copperwire = Copperwire.find(params[:id])
    @copperwire.release_status = "released"
    @copperwire.save
    respond_to do |format|
      format.html { redirect_to(copperwires_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Copperwire.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /copperwires/1
  # DELETE /copperwires/1.xml
  def destroy
    @copperwire = Copperwire.find(params[:id])
    @copperwire.destroy

    respond_to do |format|
      format.html { redirect_to(copperwires_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_copperwires] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_copperwire
      @copperwire = Copperwire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def copperwire_params
      params.require(:copperwire).permit(
        :id, :partnumber, :description, :copperwire_type, :self_bonded, 
        :diameter, :drawing_norm, :supplier, :where_used_product, :where_used_plant, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_copperwire_type, 
        :need_to_edit_self_bonded, :need_to_edit_diameter, :need_to_edit_drawing_norm, 
        :need_to_edit_supplier, :need_to_edit_where_used_product,:need_to_edit_where_used_plant,
        :reason,:need_to_edit_reason,)
    end