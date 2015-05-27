class GreasesController < ApplicationController
  before_filter :set_grease, only: [:show, :edit, :update, :destroy]
  
  # GET /greases
  # GET /greases.xml
  def index
    @filterrific = initialize_filterrific(
      Grease, params[:filterrific],
      select_options: {
      sorted_by: Grease.options_for_sorted_by,
      with_partnumber: Grease.partnumbers_for_select,
      with_description: Grease.descriptions_for_select,
      with_grease_type: Grease.grease_types_for_select,
      with_lubricated_location: Grease.lubricated_locations_for_select,
      with_drawing_norm: Grease.drawing_norms_for_select,
      with_supplier: Grease.suppliers_for_select,
      with_where_used_product: Grease.where_used_products_for_select,
      with_where_used_plant: Grease.where_used_plants_for_select,
      with_reason: Grease.reasons_for_select
    }) or return
    @greases = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /greases/1
  # GET /greases/1.xml
  def show
    @grease = Grease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grease }
    end
  end

  # GET /greases/new
  # GET /greases/new.xml
  def new
    @grease = Grease.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grease }
    end
  end

  # GET /greases/1/edit
  def edit
    @grease = Grease.find(params[:id])
    @object = Grease.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Grease.find(params[:id])
    render 'shared/correct'
  end

  # POST /greases
  # POST /greases.xml
  def create
    @grease = Grease.new(grease_params)
    @grease.uploaded_by_section = session[:user_section]
    @grease.uploader_role = session[:user_role]
    @grease.uploader_name = session[:user_name]
    @grease.release_status = "pending"

    respond_to do |format|
      if @grease.save
        format.html { redirect_to(@grease, :notice => 'Grease was successfully created.') }
        format.xml  { render :xml => @grease, :status => :created, :location => @grease }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grease.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /greases/1
  # PUT /greases/1.xml
  def update
    @grease = Grease.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @greases.release_status = "needs editing"
    else
      @grease.release_status = "pending"
    end

    respond_to do |format|
      if @grease.update_attributes(grease_params)
        format.html { redirect_to(@grease, :notice => 'Grease was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grease.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @grease = Grease.find(params[:id])
    @grease.release_status = "approved draft"
    @grease.save
    respond_to do |format|
      format.html { redirect_to(greases_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @grease = Grease.find(params[:id])
    @grease.release_status = "released"
    @grease.save
    respond_to do |format|
      format.html { redirect_to(greases_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @grease = Grease.find(params[:id])
    @grease.release_status = "block"
    @grease.save
    respond_to do |format|
      format.html { redirect_to(greases_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @grease = Grease.find(params[:id])
    @grease.release_status = "released"
    @grease.save
    respond_to do |format|
      format.html { redirect_to(greases_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Grease.find(params[:id])
    render 'shared/needs_editing'
  end

  def import
    Grease.import(params[:file])
    redirect_to root_url, notice: "Greases imported."
  end

  # DELETE /greases/1
  # DELETE /greases/1.xml
  def destroy
    @grease = Grease.find(params[:id])
    @grease.destroy

    respond_to do |format|
      format.html { redirect_to(greases_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_greases] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grease
      @grease = Grease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grease_params
      params.require(:grease).permit(:id, :partnumber, :description, :grease_type, 
        :lubricated_location, :drawing_norm, :supplier, :where_used_product, 
        :release_status, :where_used_plant,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_grease_type, 
        :need_to_edit_lubricated_location, :need_to_edit_drawing_norm, 
        :need_to_edit_supplier, :need_to_edit_where_used_product,:need_to_edit_where_used_plant,
        :need_to_edit_reason, :reason)
    end
  end