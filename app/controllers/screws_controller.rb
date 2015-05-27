class ScrewsController < ApplicationController
  before_action :set_screw, only: [:show, :edit, :update, :destroy]

  # GET /screws
  def index
    @filterrific = initialize_filterrific(
      Screw, 
      params[:filterrific],
      select_options: {
      sorted_by: Screw.options_for_sorted_by,
      with_partnumber: Screw.partnumbers_for_select,
      with_description: Screw.descriptions_for_select,
      with_screw_drive: Screw.screw_drives_for_select,
      with_screw_head: Screw.screw_heads_for_select,
      with_thread_type: Screw.thread_types_for_select,
      with_screw_size: Screw.screw_sizes_for_select,
      with_length: Screw.lengths_for_select,
      with_connection_material: Screw.connection_materials_for_select,
      with_coating: Screw.coatings_for_select,
      with_drawing_norm: Screw.drawing_norms_for_select,
      with_where_used_product: Screw.where_used_products_for_select,
      with_where_used_plant: Screw.where_used_plants_for_select,
      with_remark: Screw.remarks_for_select,
      with_reason: Screw.reasons_for_select
    }) or return
    @screws = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /screws/1
  def show
  end

  # GET /screws/new
  def new
    @screw = Screw.new
  end

  # GET /screws/1/edit
  def edit
    @object = Screw.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Screw.find(params[:id])
    render 'shared/correct'
  end

  # POST /screws
  def create
    @screw = Screw.new(screw_params)

    @screw.uploaded_by_section = session[:user_section]
    @screw.uploader_role = session[:user_role]
    @screw.uploader_name = session[:user_name]
    @screw.release_status = "pending"

    if @screw.save
      redirect_to @screw, notice: 'Screw was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /screws/1

 def update
    @screw = Screw.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @screw.release_status = "needs editing"
    else
      @screw.release_status = "pending"
    end
    if @screw.update(screw_params)
      redirect_to @screw, notice: 'Screw was successfully updated.'
    else
      render :edit
    end
  end

 def approve
    @screw = Screw.find(params[:id])
    @screw.release_status = "approved draft"
    @screw.save
    respond_to do |format|
      format.html { redirect_to(screws_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @screw = Screw.find(params[:id])
    @screw.release_status = "released"
    @screw.save
    respond_to do |format|
      format.html { redirect_to(screws_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @screw = Screw.find(params[:id])
    @screw.release_status = "block"
    @screw.save
    respond_to do |format|
      format.html { redirect_to(screws_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @screw = Screw.find(params[:id])
    @screw.release_status = "released"
    @screw.save
    respond_to do |format|
      format.html { redirect_to(screws_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Screw.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /screws/1
  def destroy
    @screw.destroy
    redirect_to screws_url, notice: 'Screw was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_screws] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screw
      @screw = Screw.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def screw_params
      params.require(:screw).permit(:id, :partnumber, :description, :screw_drive, :screw_head, 
        :thread_type, :screw_size, :length, :connection_material, :coating, :drawing_norm, 
        :where_used_product, :where_used_plant, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_screw_drive, 
        :need_to_edit_screw_head, :need_to_edit_thread_type, :need_to_edit_screw_size, 
        :need_to_edit_length, :need_to_edit_connection_material, :need_to_edit_coating, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_remark,:need_to_edit_reason,
        :reason)
    end
end
