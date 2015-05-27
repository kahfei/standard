class SpiralSpringsController < ApplicationController
  before_action :set_spiral_spring, only: [:show, :edit, :update, :destroy]

  # GET /spiral_springs
  def index
    @filterrific = initialize_filterrific(
      SpiralSpring, 
      params[:filterrific],
      select_options: {
      sorted_by: SpiralSpring.options_for_sorted_by,
      with_partnumber: SpiralSpring.partnumbers_for_select,
      with_description: SpiralSpring.descriptions_for_select,
      with_material_thickness: SpiralSpring.material_thicknesss_for_select,
      with_material_width: SpiralSpring.material_widths_for_select,
      with_outer_dia: SpiralSpring.outer_dias_for_select,
      with_torsion_arm_length: SpiralSpring.torsion_arm_lengths_for_select,
      with_torsion_arm_movable_distance: SpiralSpring.torsion_arm_movable_distances_for_select,
      with_initial_force: SpiralSpring.initial_forces_for_select,
      with_final_force: SpiralSpring.final_forces_for_select,
      with_supplier: SpiralSpring.suppliers_for_select,
      with_drawing_norm: SpiralSpring.drawing_norms_for_select,
      with_where_used_product: SpiralSpring.where_used_products_for_select,
      with_where_used_plant: SpiralSpring.where_used_plants_for_select,
      with_reason: SpiralSpring.reasons_for_select
    }) or return
    @spiral_springs = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /spiral_springs/1
  def show
  end

  # GET /spiral_springs/new
  def new
    @spiral_spring = SpiralSpring.new
  end

  # GET /spiral_springs/1/edit
  def edit
    @object = SpiralSpring.find(params[:id])
    render 'shared/edit'
  end
  
  def correct
    @object = SpiralSpring.find(params[:id])
    render 'shared/correct'
  end

  # POST /spiral_springs
  def create
    @spiral_spring = SpiralSpring.new(spiral_spring_params)

    @spiral_spring.uploaded_by_section = session[:user_section]
    @spiral_spring.uploader_role = session[:user_role]
    @spiral_spring.uploader_name = session[:user_name]
    @spiral_spring.release_status = "pending"

    if @spiral_spring.save
      redirect_to @spiral_spring, notice: 'Spiral spring was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spiral_springs/1
  def update
    @spiral_spring = SpiralSpring.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @spiral_spring.release_status = "needs editing"
    else
      @spiral_spring.release_status = "pending"
    end
    if @spiral_spring.update(spiral_spring_params)
      redirect_to @spiral_spring, notice: 'Spiral spring was successfully updated.'
    else
      render :edit
    end
  end

  def approve
    @spiral_spring = SpiralSpring.find(params[:id])
    @spiral_spring.release_status = "approved draft"
    @spiral_spring.save
    respond_to do |format|
      format.html { redirect_to(spiral_springs_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @spiral_spring = SpiralSpring.find(params[:id])
    @spiral_spring.release_status = "released"
    @spiral_spring.save
    respond_to do |format|
      format.html { redirect_to(spiral_springs_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @spiral_spring = SpiralSpring.find(params[:id])
    @spiral_spring.release_status = "block"
    @spiral_spring.save
    respond_to do |format|
      format.html { redirect_to(spiral_springs_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @spiral_spring = SpiralSpring.find(params[:id])
    @spiral_spring.release_status = "released"
    @spiral_spring.save
    respond_to do |format|
      format.html { redirect_to(spiral_springs_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = SpiralSpring.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /spiral_springs/1
  def destroy
    @spiral_spring.destroy
    redirect_to spiral_springs_url, notice: 'Spiral spring was successfully destroyed.'
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_spiral_springs] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spiral_spring
      @spiral_spring = SpiralSpring.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spiral_spring_params
      params.require(:spiral_spring).permit(:id, :partnumber, :description, :material_thickness, 
        :material_width, :outer_dia, :torsion_arm_length, :torsion_arm_movable_distance, 
        :initial_force, :final_force, :supplier, :drawing_norm, :where_used_product, :where_used_plant, 
        :release_status, 
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_material_thickness, 
        :need_to_edit_material_width, :need_to_edit_outer_dia, :need_to_edit_torsion_arm_length, 
        :need_to_edit_torsion_arm_movable_distance, :need_to_edit_initial_force, :need_to_edit_final_force, 
        :need_to_edit_supplier, :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_reason,
        :reason)
    end
end
