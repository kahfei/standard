class ConnectorsController < ApplicationController
  # GET /connectors
  # GET /connectors.xml
  def index
    @filterrific = initialize_filterrific(
      Connector, 
      params[:filterrific],
      select_options: {
      sorted_by: Connector.options_for_sorted_by,
      with_partnumber: Connector.partnumbers_for_select,
      with_description: Connector.descriptions_for_select,
      with_connector_type: Connector.connector_types_for_select,
      with_drawing_norm: Connector.drawing_norms_for_select,
      with_h_x_w: Connector.h_x_ws_for_select,
      with_supplier: Connector.suppliers_for_select,
      with_where_used_product: Connector.where_used_products_for_select,
      with_where_used_plant: Connector.where_used_plants_for_select,
      with_reason: Connector.reasons_for_select
    }) or return
    @connectors = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /connectors/1
  # GET /connectors/1.xml
  def show
    @connector = Connector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @connector }
    end
  end

  # GET /connectors/new
  # GET /connectors/new.xml
  def new
    @connector = Connector.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @connector }
    end
  end

  # GET /connectors/1/edit
  def edit
    @connector = Connector.find(params[:id])
    @object = Connector.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Connector.find(params[:id])
    render 'shared/correct'
  end

  # POST /connectors
  # POST /connectors.xml
  def create
    @connector = Connector.new(connector_params)

    @connector.uploaded_by_section = session[:user_section]
    @connector.uploader_role = session[:user_role]
    @connector.uploader_name = session[:user_name]
    @connector.release_status = "pending"

    respond_to do |format|
      if @connector.save
        format.html { redirect_to(@connector, :notice => 'Connector was successfully created.') }
        format.xml  { render :xml => @connector, :status => :created, :location => @connector }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @connector.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /connectors/1
  # PUT /connectors/1.xml
  def update
    @connector = Connector.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @connector.release_status = "needs editing"
    else
      @connector.release_status = "pending"
    end
    respond_to do |format|
      if @connector.update_attributes(connector_params)
        format.html { redirect_to(@connector, :notice => 'Connector was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @connector.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @connector = Connector.find(params[:id])
    @connector.release_status = "approved draft"
    @connector.save
    respond_to do |format|
      format.html { redirect_to(connectors_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @connector = Connector.find(params[:id])
    @connector.release_status = "released"
    @connector.save
    respond_to do |format|
      format.html { redirect_to(connectors_url) }
      format.xml  { head :ok }
    end
  end
  
   def block
    @connector = Connector.find(params[:id])
    @connector.release_status = "block"
    @connector.save
    respond_to do |format|
      format.html { redirect_to(connectors_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @connector = Connector.find(params[:id])
    @connector.release_status = "released"
    @connector.save
    respond_to do |format|
      format.html { redirect_to(connectors_url) }
      format.xml  { head :ok }
    end
  end
  
  def needs_editing
    @object = Connector.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /connectors/1
  # DELETE /connectors/1.xml
  def destroy
    @connector = Connector.find(params[:id])
    @connector.destroy

    respond_to do |format|
      format.html { redirect_to(connectors_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_connectors] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_connector
      @connector = Connector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connector_params
      params.require(:connector).permit(
        :id, :partnumber, :description, 
        :connector_type, :drawing_norm, :h_x_w, :supplier, 
        :where_used_product, :where_used_plant,:release_status,
        :need_to_edit_partnumber, :need_to_edit_description, 
        :need_to_edit_connector_type, :need_to_edit_drawing_norm, 
        :need_to_edit_h_x_w, :need_to_edit_supplier, 
        :need_to_edit_where_used_product,:need_to_edit_where_used_plant,
        :need_to_edit_reason,:reason)
    end