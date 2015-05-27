class SpringsController < ApplicationController
  before_action :set_spring, only: [:show, :edit, :update, :destroy]

  # GET /springs
  def index
    @filterrific = initialize_filterrific(
      Spring, 
      params[:filterrific],
      select_options: {
      sorted_by: Spring.options_for_sorted_by,
      with_partnumber: Spring.partnumbers_for_select,
      with_description: Spring.descriptions_for_select,
      with_spring_type: Spring.spring_types_for_select,
      with_material_dia: Spring.material_dias_for_select,
      with_mean_dia: Spring.mean_dias_for_select,
      with_free_length: Spring.free_lengths_for_select,
      with_no_of_active_coils: Spring.no_of_active_coilss_for_select,
      with_solid_length_max: Spring.solid_length_maxs_for_select,
      with_dimension_f1: Spring.dimension_f1s_for_select,
      with_dimension_l1: Spring.dimension_l1s_for_select,
      with_dimension_f2: Spring.dimension_f2s_for_select,
      with_dimension_l2: Spring.dimension_l2s_for_select,
      with_initial_load_nm: Spring.initial_load_nms_for_select,
      with_final_load_nm: Spring.final_load_nms_for_select,
      with_torque_arm_length: Spring.torque_arm_lengths_for_select,
      with_hook_length: Spring.hook_lengths_for_select,
      with_hook_arc_radius: Spring.hook_arc_radiuss_for_select,
      with_spring_constant: Spring.spring_constants_for_select,
      with_unit: Spring.units_for_select,
      with_supplier: Spring.suppliers_for_select,
      with_drawing_norm: Spring.drawing_norms_for_select,
      with_where_used_product: Spring.where_used_products_for_select,
      with_where_used_plant: Spring.where_used_plants_for_select,
      with_remark: Spring.remarks_for_select,
      with_reason: Spring.reasons_for_select,
    }) or return
    @springs = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /springs/1
  def show
  end

  # GET /springs/new
  def new
    @spring = Spring.new
  end

  # GET /springs/1/edit
  def edit
    @object = Spring.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = Spring.find(params[:id])
    render 'shared/correct'
  end


  # POST /springs
  def create
    @spring = Spring.new(spring_params)

    @spring.uploaded_by_section = session[:user_section]
    @spring.uploader_role = session[:user_role]
    @spring.uploader_name = session[:user_name]
    @spring.release_status = "pending"

    if @spring.save
      redirect_to @spring, notice: 'Spring was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /springs/1
  def update
    @spring = Spring.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @spring.release_status = "needs editing"
    else
      @spring.release_status = "pending"
    end
    if @spring.update(spring_params)
      redirect_to @spring, notice: 'Spring was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @spring = Spring.find(params[:id])
    @spring.release_status = "approved draft"
    @spring.save
    respond_to do |format|
      format.html { redirect_to(springs_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @spring = Spring.find(params[:id])
    @spring.release_status = "released"
    @spring.save
    respond_to do |format|
      format.html { redirect_to(springs_url) }
      format.xml  { head :ok }
    end
  end

   def block
    @spring = Spring.find(params[:id])
    @spring.release_status = "block"
    @spring.save
    respond_to do |format|
      format.html { redirect_to(springs_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @spring = Spring.find(params[:id])
    @spring.release_status = "released"
    @spring.save
    respond_to do |format|
      format.html { redirect_to(springs_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = Spring.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /springs/1
  def destroy
    @spring.destroy
    redirect_to springs_url, notice: 'Spring was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_springs] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spring
      @spring = Spring.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spring_params
      params.require(:spring).permit(:id, :partnumber, :description, :spring_type, :material_dia, 
        :mean_dia, :free_length, :no_of_active_coils, :solid_length_max, :dimension_f1, :dimension_l1, 
        :dimension_f2, :dimension_l2, :initial_load_nm, :final_load_nm, :torque_arm_length, :hook_length, 
        :hook_arc_radius, :spring_constant, :unit, :supplier, :drawing_norm, :where_used_product, 
        :where_used_plant, :remark, :release_status, 
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_spring_type, 
        :need_to_edit_material_dia, :need_to_edit_mean_dia, :need_to_edit_free_length, 
        :need_to_edit_no_of_active_coils, :need_to_edit_solid_length_max, :need_to_edit_dimension_f1, 
        :need_to_edit_dimension_l1, :need_to_edit_dimension_f2, :need_to_edit_dimension_l2, 
        :need_to_edit_initial_load_nm, :need_to_edit_final_load_nm, :need_to_edit_torque_arm_length, 
        :need_to_edit_hook_length, :need_to_edit_hook_arc_radius, :need_to_edit_spring_constant, 
        :need_to_edit_unit, :need_to_edit_supplier, :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end
end
