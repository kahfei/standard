class AnchorLogosController < ApplicationController
	def index
    @filterrific = initialize_filterrific(
      AnchorLogo, 
      params[:filterrific],
      select_options: {
      sorted_by: AnchorLogo.options_for_sorted_by,
      with_housing_partnumber: AnchorLogo.housing_partnumbers_for_select,
      with_housing_supplier: AnchorLogo.housing_suppliers_for_select,
      with_anchor_logo_diameter: AnchorLogo.anchor_logo_diameters_for_select,
      with_partnumber: AnchorLogo.partnumbers_for_select,
      with_anchor_logo_supplier: AnchorLogo.anchor_logo_suppliers_for_select,
      with_bosch_logo_partnumber: AnchorLogo.bosch_logo_partnumbers_for_select,
      with_bosch_logo_supplier: AnchorLogo.bosch_logo_suppliers_for_select,
      with_where_used_product: AnchorLogo.where_used_products_for_select,
      with_where_used_plant: AnchorLogo.where_used_plants_for_select,
      with_remark: AnchorLogo.remarks_for_select,
      with_reason: AnchorLogo.reasons_for_select,
    }) or return
    @anchor_logos = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /anchor_logos/1
  # GET /anchor_logos/1.xml
  def show
    @anchor_logo = AnchorLogo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @anchor_logo }
    end
  end

  # GET /anchor_logos/new
  # GET /anchor_logos/new.xml
  def new
    @anchor_logo = AnchorLogo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anchor_logo }
    end
  end

  # GET /anchor_logos/1/edit
  def edit
    @anchor_logo = AnchorLogo.find(params[:id])
    @object = AnchorLogo.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = AnchorLogo.find(params[:id])
    render 'shared/correct'
  end

  # POST /anchor_logos
  # POST /anchor_logos.xml
  def create
    @anchor_logo = AnchorLogo.new(anchor_logo_params)

    @anchor_logo.uploaded_by_section = session[:user_section]
    @anchor_logo.uploader_role = session[:user_role]
    @anchor_logo.uploader_name = session[:user_name]
    @anchor_logo.release_status = "pending"

    respond_to do |format|
      if @anchor_logo.save
        format.html { redirect_to(@anchor_logo, :notice => 'Anchor Logo was successfully created.') }
        format.xml  { render :xml => @anchor_logo, :status => :created, :location => @anchor_logo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anchor_logo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anchor_logos/1
  # PUT /anchor_logos/1.xml
  def update
    @anchor_logo = AnchorLogo.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @anchor_logo.release_status = "needs editing"
    else
      @anchor_logo.release_status = "pending"
    end
    respond_to do |format|
      if @anchor_logo.update_attributes(anchor_logo_params)
        format.html { redirect_to(@anchor_logo, :notice => 'Achor Logo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anchor_logo.errors, :status => :unprocessable_entity }
      end
    end
  end

  
 def approve
    @anchor_logo = AnchorLogo.find(params[:id])
    @anchor_logo.release_status = "approved draft"
    @anchor_logo.save
    respond_to do |format|
      format.html { redirect_to(anchor_logos_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @anchor_logo = AnchorLogo.find(params[:id])
    @anchor_logo.release_status = "released"
    @anchor_logo.save
    respond_to do |format|
      format.html { redirect_to(anchor_logos_url) }
      format.xml  { head :ok }
    end
  end

  def block
    @anchor_logo = AnchorLogo.find(params[:id])
    @anchor_logo.release_status = "block"
    @anchor_logo.save
    respond_to do |format|
      format.html { redirect_to(anchor_logos_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @anchor_logo = AnchorLogo.find(params[:id])
    @anchor_logo.release_status = "released"
    @anchor_logo.save
    respond_to do |format|
      format.html { redirect_to(anchor_logos_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = AnchorLogo.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /anchor_logos/1
  # DELETE /anchor_logos/1.xml
  def destroy
    @anchor_logo = AnchorLogo.find(params[:id])
    @anchor_logo.destroy

    respond_to do |format|
      format.html { redirect_to(anchor_logos_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_anchor_logos] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_anchor_logo
      @anchor_logo = AnchorLogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anchor_logo_params
      params.require(:anchor_logo).permit(
        :id, 
        :housing_partnumber, 
        :housing_supplier, 
        :anchor_logo_diameter, 
        :partnumber, 
        :anchor_logo_supplier, 
        :bosch_logo_partnumber, 
        :bosch_logo_supplier, 
        :where_used_product, 
        :where_used_plant, 
        :release_status,
        :reason,
        :remark,
        :need_to_edit_housing_partnumber, 
        :need_to_edit_housing_supplier, 
        :need_to_edit_anchor_logo_diameter, 
        :need_to_edit_partnumber, 
        :need_to_edit_anchor_logo_supplier, 
        :need_to_edit_bosch_logo_partnumber, 
        :need_to_edit_bosch_logo_supplier, 
        :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant,
        :need_to_edit_remark,
        :need_to_edit_reason)
    end



end
