class AcMotorsController < ApplicationController
	def index

    @filterrific = initialize_filterrific(
      AcMotor, 
      params[:filterrific],
      select_options: {
      sorted_by: AcMotor.options_for_sorted_by,
      with_arm_part_no: AcMotor.arm_part_nos_for_select,
      with_motor_size: AcMotor.motor_sizes_for_select,
      with_armature_drw: AcMotor.armature_drws_for_select,
      with_field_part_no: AcMotor.field_part_nos_for_select,
      with_field_drw: AcMotor.field_drws_for_select,
      with_voltage: AcMotor.voltages_for_select,
      with_power: AcMotor.powers_for_select,
      with_amps_rating: AcMotor.amps_ratings_for_select,
      with_output_rpm: AcMotor.output_rpms_for_select,
      with_rotation: AcMotor.rotations_for_select,
      with_no_load_rpm_motor: AcMotor.no_load_rpm_motors_for_select,
      with_gear_ratio: AcMotor.gear_ratios_for_select,
      with_arm_wire_dia: AcMotor.arm_wire_dias_for_select,
      with_field_wire_dia: AcMotor.field_wire_dias_for_select,
      with_winding_type: AcMotor.winding_types_for_select,
      with_arm_resistance: AcMotor.arm_resistances_for_select,
      with_displace_angle: AcMotor.displace_angles_for_select,
      with_arm_no_of_turns: AcMotor.arm_no_of_turnss_for_select,
      with_field_no_of_turns: AcMotor.field_no_of_turnss_for_select,
      with_field_resistance: AcMotor.field_resistances_for_select,
      with_field_wind_drw: AcMotor.field_wind_drws_for_select,
      with_arm_package: AcMotor.arm_packages_for_select,
      with_shaft_part_no: AcMotor.shaft_part_nos_for_select,
      with_shaft_drw: AcMotor.shaft_drws_for_select,
      with_arm_stack: AcMotor.arm_stacks_for_select,
      with_arm_laminate: AcMotor.arm_laminates_for_select,
      with_field_stack: AcMotor.field_stacks_for_select,
      with_field_stack_opt: AcMotor.field_stack_opts_for_select,
      with_arm_end_lami: AcMotor.arm_end_lamis_for_select,
      with_molding_comp: AcMotor.molding_comps_for_select,
      with_commutator: AcMotor.commutators_for_select,
      with_arm_copper_wire: AcMotor.arm_copper_wires_for_select,
      with_arm_wire_drw: AcMotor.arm_wire_drws_for_select,
      with_field_copper_wire: AcMotor.field_copper_wires_for_select,
      with_arm_fan: AcMotor.arm_fans_for_select,
      with_insulating_tube: AcMotor.insulating_tubes_for_select,
      with_insulator: AcMotor.insulators_for_select,
      with_hard_paper_tube: AcMotor.hard_paper_tubes_for_select,
      with_slot_insulation: AcMotor.slot_insulations_for_select,
      with_slot_wedge: AcMotor.slot_wedges_for_select,
      with_pressboard: AcMotor.pressboards_for_select,
      with_field_insulation_paper: AcMotor.field_insulation_papers_for_select,
      with_connection_plate: AcMotor.connection_plates_for_select,
      with_conn_plate_opt: AcMotor.conn_plate_opts_for_select,
      with_end_plate: AcMotor.end_plates_for_select,
      with_end_plate_opt: AcMotor.end_plate_opts_for_select,
      with_polyester_resin: AcMotor.polyester_resins_for_select,
      with_resin_hardener: AcMotor.resin_hardeners_for_select,
      with_hardener_adhesive: AcMotor.hardener_adhesives_for_select,
      with_impregnating_resin: AcMotor.impregnating_resins_for_select,
      with_impreg_hardener: AcMotor.impreg_hardeners_for_select,
      with_receptacle_01: AcMotor.receptacle_01s_for_select,
      with_receptacle_02: AcMotor.receptacle_02s_for_select,
      with_field_impregn_resin: AcMotor.field_impregn_resins_for_select,
      with_field_resin_hard: AcMotor.field_resin_hards_for_select,
      with_filed_coating: AcMotor.filed_coatings_for_select,
      with_field_heat_sink: AcMotor.field_heat_sinks_for_select,
      with_field_pressboard: AcMotor.field_pressboards_for_select,
      with_where_used_product: AcMotor.where_used_products_for_select,
      with_where_used_plant: AcMotor.where_used_plants_for_select,
      with_remark: AcMotor.remarks_for_select,
      with_reason: AcMotor.reasons_for_select,
    }) or return
    @ac_motors = @filterrific.find.page(params[:page])
    session[:filterrific_ac_motors] = @filterrific.to_hash
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /ac_motors/1
  # GET /ac_motors/1.xml
  def show
    @ac_motor = AcMotor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ac_motor }
    end
  end

  # GET /ac_motors/new
  # GET /ac_motors/new.xml
  def new
    @ac_motor = AcMotor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ac_motor }
    end
  end

  # GET /ac_motors/1/edit
  def edit
    @ac_motor = AcMotor.find(params[:id])
    @object = AcMotor.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = AcMotor.find(params[:id])
    render 'shared/correct'
  end

  # POST /ac_motors
  # POST /ac_motors.xml
  def create
    @ac_motor = AcMotor.new(ac_motor_params)

    @ac_motor.uploaded_by_section = session[:user_section]
    @ac_motor.uploader_role = session[:user_role]
    @ac_motor.uploader_name = session[:user_name]
    @ac_motor.release_status = "pending"

    respond_to do |format|
      if @ac_motor.save
        format.html { redirect_to(@ac_motor, :notice => 'AC Motor was successfully created.') }
        format.xml  { render :xml => @ac_motor, :status => :created, :location => @ac_motor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ac_motor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ac_motors/1
  # PUT /ac_motors/1.xml
  def update
    @ac_motor = AcMotor.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @ac_motor.release_status = "needs editing"
    else
      @ac_motor.release_status = "pending"
    end
    respond_to do |format|
      if @ac_motor.update_attributes(ac_motor_params)
        format.html { redirect_to(@ac_motor, :notice => 'AC Motor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ac_motor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @ac_motor = AcMotor.find(params[:id])
    @ac_motor.release_status = "approved draft"
    @ac_motor.save
    respond_to do |format|
      format.html { redirect_to(ac_motors_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @ac_motor = AcMotor.find(params[:id])
    @ac_motor.release_status = "released"
    @ac_motor.save
    respond_to do |format|
      format.html { redirect_to(ac_motors_url) }
      format.xml  { head :ok }
    end
  end

  def block
    @ac_motor = AcMotor.find(params[:id])
    @ac_motor.release_status = "block"
    @ac_motor.save
    respond_to do |format|
      format.html { redirect_to(ac_motors_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @ac_motor = AcMotor.find(params[:id])
    @ac_motor.release_status = "released"
    @ac_motor.save
    respond_to do |format|
      format.html { redirect_to(ac_motors_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = AcMotor.find(params[:id])
    render 'shared/needs_editing'
  end

  # DELETE /ac_motors/1
  # DELETE /ac_motors/1.xml
  def destroy
    @ac_motor = AcMotor.find(params[:id])
    @ac_motor.destroy

    respond_to do |format|
      format.html { redirect_to(ac_motors_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_ac_motors] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_ac_motor
      @ac_motor = AcMotor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ac_motor_params
      params.require(:ac_motor).permit(
        :id,
        :arm_part_no,
        :motor_size,
        :armature_drw,
        :field_part_no,
        :field_drw,
        :voltage,
        :power,
        :amps_rating,
        :output_rpm,
        :rotation,
        :no_load_rpm_motor,
        :gear_ratio,
        :arm_wire_dia,
        :field_wire_dia,
        :winding_type,
        :arm_resistance,
        :displace_angle,
        :arm_no_of_turns,
        :field_no_of_turns,
        :field_resistance,
        :field_wind_drw,
        :arm_package,
        :shaft_part_no,
        :shaft_drw,
        :arm_stack,
        :arm_laminate,
        :field_stack,
        :field_stack_opt,
        :arm_end_lami,
        :molding_comp,
        :commutator,
        :arm_copper_wire,
        :arm_wire_drw,
        :field_copper_wire,
        :arm_fan,
        :insulating_tube,
        :insulator,
        :hard_paper_tube,
        :slot_insulation,
        :slot_wedge,
        :pressboard,
        :field_insulation_paper,
        :connection_plate,
        :conn_plate_opt,
        :end_plate,
        :end_plate_opt,
        :polyester_resin,
        :resin_hardener,
        :hardener_adhesive,
        :impregnating_resin,
        :impreg_hardener,
        :receptacle_01,
        :receptacle_02,
        :field_impregn_resin,
        :field_resin_hard,
        :filed_coating,
        :field_heat_sink,
        :field_pressboard,
        :where_used_product,
        :where_used_plant,
        :remark,
        :reason,
        :release_status,
        :need_to_edit_arm_part_no,
        :need_to_edit_motor_size,
        :need_to_edit_armature_drw,
        :need_to_edit_field_part_no,
        :need_to_edit_field_drw,
        :need_to_edit_voltage,
        :need_to_edit_power,
        :need_to_edit_amps_rating,
        :need_to_edit_output_rpm,
        :need_to_edit_rotation,
        :need_to_edit_no_load_rpm_motor,
        :need_to_edit_gear_ratio,
        :need_to_edit_arm_wire_dia,
        :need_to_edit_field_wire_dia,
        :need_to_edit_winding_type,
        :need_to_edit_arm_resistance,
        :need_to_edit_displace_angle,
        :need_to_edit_arm_no_of_turns,
        :need_to_edit_field_no_of_turns,
        :need_to_edit_field_resistance,
        :need_to_edit_field_wind_drw,
        :need_to_edit_arm_package,
        :need_to_edit_shaft_part_no,
        :need_to_edit_shaft_drw,
        :need_to_edit_arm_stack,
        :need_to_edit_arm_laminate,
        :need_to_edit_field_stack,
        :need_to_edit_field_stack_opt,
        :need_to_edit_arm_end_lami,
        :need_to_edit_molding_comp,
        :need_to_edit_commutator,
        :need_to_edit_arm_copper_wire,
        :need_to_edit_arm_wire_drw,
        :need_to_edit_field_copper_wire,
        :need_to_edit_arm_fan,
        :need_to_edit_insulating_tube,
        :need_to_edit_insulator,
        :need_to_edit_hard_paper_tube,
        :need_to_edit_slot_insulation,
        :need_to_edit_slot_wedge,
        :need_to_edit_pressboard,
        :need_to_edit_field_insulation_paper,
        :need_to_edit_connection_plate,
        :need_to_edit_conn_plate_opt,
        :need_to_edit_end_plate,
        :need_to_edit_end_plate_opt,
        :need_to_edit_polyester_resin,
        :need_to_edit_resin_hardener,
        :need_to_edit_hardener_adhesive,
        :need_to_edit_impregnating_resin,
        :need_to_edit_impreg_hardener,
        :need_to_edit_receptacle_01,
        :need_to_edit_receptacle_02,
        :need_to_edit_field_impregn_resin,
        :need_to_edit_field_resin_hard,
        :need_to_edit_filed_coating,
        :need_to_edit_field_heat_sink,
        :need_to_edit_field_pressboard,
        :need_to_edit_where_used_product,
        :need_to_edit_where_used_plant,
        :need_to_edit_remark
)
    end



end
