class CapacitorsController < ApplicationController
  # GET /capacitors
  # GET /capacitors.xml
  def index
    @filterrific = initialize_filterrific(
      Capacitor, 
      params[:filterrific],
      select_options: {
      sorted_by: Capacitor.options_for_sorted_by,
      with_partnumber: Capacitor.partnumbers_for_select,
      with_description: Capacitor.descriptions_for_select,
      with_capacitor_type: Capacitor.capacitor_types_for_select,
      with_capacity: Capacitor.capacitys_for_select,
      with_feet: Capacitor.feets_for_select,
      with_capacitor_class: Capacitor.capacitor_classs_for_select,
      with_drawing_norm: Capacitor.drawing_norms_for_select,
      with_where_used_product: Capacitor.where_used_products_for_select,
      with_where_used_plant: Capacitor.where_used_plants_for_select,
      with_remark: Capacitor.remarks_for_select,
      with_reason: Capacitor.reasons_for_select
    }) or return
    @capacitors = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /capacitors/1
  # GET /capacitors/1.xml
  def show
    @capacitor = Capacitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @capacitor }
    end
  end

  # GET /capacitors/new
  # GET /capacitors/new.xml
  def new
    @capacitor = Capacitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @capacitor }
    end
  end

  # GET /capacitors/1/edit
  def edit
    @capacitor = Capacitor.find(params[:id])
    @object = Capacitor.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Capacitor.find(params[:id])
    render 'shared/correct'
  end

  # POST /capacitors
  # POST /capacitors.xml
  def create
    @capacitor = Capacitor.new(capacitor_params)

    @capacitor.uploaded_by_section = session[:user_section]
    @capacitor.uploader_role = session[:user_role]
    @capacitor.uploader_name = session[:user_name]
    @capacitor.release_status = "pending"

    respond_to do |format|
      if @capacitor.save
        format.html { redirect_to(@capacitor, :notice => 'Capacitor was successfully created.') }
        format.xml  { render :xml => @capacitor, :status => :created, :location => @capacitor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @capacitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /capacitors/1
  # PUT /capacitors/1.xml
  def update
    @capacitor = Capacitor.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @capacitor.release_status = "needs editing"
    else
      @capacitor.release_status = "pending"
    end
    respond_to do |format|
      if @capacitor.update_attributes(capacitor_params)
        format.html { redirect_to(@capacitor, :notice => 'Capacitor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @capacitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @capacitor = Capacitor.find(params[:id])
    @capacitor.release_status = "approved draft"
    @capacitor.save
    respond_to do |format|
      format.html { redirect_to(capacitors_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @capacitor = Capacitor.find(params[:id])
    @capacitor.release_status = "released"
    @capacitor.save
    respond_to do |format|
      format.html { redirect_to(capacitors_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @capacitor = Capacitor.find(params[:id])
    @capacitor.release_status = "block"
    @capacitor.save
    respond_to do |format|
      format.html { redirect_to(capacitors_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @capacitor = Capacitor.find(params[:id])
    @capacitor.release_status = "released"
    @capacitor.save
    respond_to do |format|
      format.html { redirect_to(capacitors_url) }
      format.xml  { head :ok }
    end
  end


  def needs_editing
    @object= Capacitor.find(params[:id])
    render 'shared/needs_editing'
  end
  # DELETE /capacitors/1
  # DELETE /capacitors/1.xml
  def destroy
    @capacitor = Capacitor.find(params[:id])
    @capacitor.destroy

    respond_to do |format|
      format.html { redirect_to(capacitors_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_capacitors] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_capacitor
      @capacitor = Capacitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capacitor_params
      params.require(:capacitor).permit(:id, :partnumber, :description, :capacitor_type, 
        :capacity, :feet, :capacitor_class, :drawing_norm, :where_used_product, 
        :where_used_plant, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_capacitor_type, 
        :need_to_edit_capacity, :need_to_edit_feet, :need_to_edit_capacitor_class, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end