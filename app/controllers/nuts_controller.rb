class NutsController < ApplicationController
  before_action :set_nut, only: [:show, :edit, :update, :destroy]

  # GET /nuts
  def index
    @filterrific = initialize_filterrific(
      Nut, 
      params[:filterrific],
      select_options: {
      sorted_by: Nut.options_for_sorted_by,
      with_partnumber: Nut.partnumbers_for_select,
      with_description: Nut.descriptions_for_select,
      with_nut_type: Nut.nut_types_for_select,
      with_nut_size: Nut.nut_sizes_for_select,
      with_width: Nut.widths_for_select,
      with_coating: Nut.coatings_for_select,
      with_drawing_norm: Nut.drawing_norms_for_select,
      with_where_used_product: Nut.where_used_products_for_select,
      with_where_used_plant: Nut.where_used_plants_for_select,
      with_remark: Nut.remarks_for_select,
      with_reason: Nut.reasons_for_select
    }) or return
    @nuts = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /nuts/1
  def show
  end

  # GET /nuts/new
  def new
    @nut = Nut.new
  end

  # GET /nuts/1/edit
  def edit
    @object = Nut.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Nut.find(params[:id])
    render 'shared/correct'
  end

  # POST /nuts
  def create
    @nut = Nut.new(nut_params)

    @nut.uploaded_by_section = session[:user_section]
    @nut.uploader_role = session[:user_role]
    @nut.uploader_name = session[:user_name]
    @nut.release_status = "pending"

    if @nut.save
      redirect_to @nut, notice: 'Nut was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /nuts/1
  def update
    @nut = Nut.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @nut.release_status = "needs editing"
    else
      @nut.release_status = "pending"
    end
    if @nut.update(nut_params)
      redirect_to @nut, notice: 'Nut was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @nut = Nut.find(params[:id])
    @nut.release_status = "approved draft"
    @nut.save
    respond_to do |format|
      format.html { redirect_to(nuts_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @nut = Nut.find(params[:id])
    @nut.release_status = "released"
    @nut.save
    respond_to do |format|
      format.html { redirect_to(nuts_url) }
      format.xml  { head :ok }
    end
  end

  def block
    @nut = Nut.find(params[:id])
    @nut.release_status = "block"
    @nut.save
    respond_to do |format|
      format.html { redirect_to(nuts_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @nut = Nut.find(params[:id])
    @nut.release_status = "released"
    @nut.save
    respond_to do |format|
      format.html { redirect_to(nuts_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Nut.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /nuts/1
  def destroy
    @nut.destroy
    redirect_to nuts_url, notice: 'Nut was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_nuts] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nut
      @nut = Nut.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nut_params
      params.require(:nut).permit(:id, :partnumber, :description, :nut_type, :nut_size, :width, 
        :drawing_norm, :coating, :where_used_product, :where_used_plant, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_nut_type, 
        :need_to_edit_nut_size, :need_to_edit_width, :need_to_edit_drawing_norm, 
        :need_to_edit_coating, :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end
end
