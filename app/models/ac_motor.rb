class AcMotor < ActiveRecord::Base
    # include ValidateMethods 
    # need to write Validation separately as fields are different
    include CommonConstants
    validates :arm_part_no, length: { is: 10 }
    validates_presence_of self.column_names - (self.column_names.select { |c| c.start_with? "need_to_edit" } << ["created_at","id","updated_at","uploaded_by_section","uploader_role","uploader_name"]).flatten

    after_initialize :init


    self.per_page = 15

  def self.search(query)
  		where(
  		'release_status LIKE ? or 
  		arm_part_no LIKE ? or 
		motor_size LIKE ? or 
		armature_drw LIKE ? or 
		field_part_no LIKE ? or 
		field_drw LIKE ? or 
		voltage LIKE ? or 
		power LIKE ? or 
		amps_rating LIKE ? or 
		output_rpm LIKE ? or 
		rotation LIKE ? or 
		no_load_rpm_motor LIKE ? or 
		gear_ratio LIKE ? or 
		arm_wire_dia LIKE ? or 
		field_wire_dia LIKE ? or 
		winding_type LIKE ? or 
		arm_resistance LIKE ? or 
		displace_angle LIKE ? or 
		arm_no_of_turns LIKE ? or 
		field_no_of_turns LIKE ? or 
		field_resistance LIKE ? or 
		field_wind_drw LIKE ? or 
		arm_package LIKE ? or 
		shaft_part_no LIKE ? or 
		shaft_drw LIKE ? or 
		arm_stack LIKE ? or 
		arm_laminate LIKE ? or 
		field_stack LIKE ? or 
		field_stack_opt LIKE ? or 
		arm_end_lami LIKE ? or 
		molding_comp LIKE ? or 
		commutator LIKE ? or 
		arm_copper_wire LIKE ? or 
		arm_wire_drw LIKE ? or 
		field_copper_wire LIKE ? or 
		arm_fan LIKE ? or 
		insulating_tube LIKE ? or 
		insulator LIKE ? or 
		hard_paper_tube LIKE ? or 
		slot_insulation LIKE ? or 
		slot_wedge LIKE ? or 
		pressboard LIKE ? or 
		field_insulation_paper LIKE ? or 
		connection_plate LIKE ? or 
		conn_plate_opt LIKE ? or 
		end_plate LIKE ? or 
		end_plate_opt LIKE ? or 
		polyester_resin LIKE ? or 
		resin_hardener LIKE ? or 
		hardener_adhesive LIKE ? or 
		impregnating_resin LIKE ? or 
		impreg_hardener LIKE ? or 
		receptacle_01 LIKE ? or 
		receptacle_02 LIKE ? or 
		field_impregn_resin LIKE ? or 
		field_resin_hard LIKE ? or 
		filed_coating LIKE ? or 
		field_heat_sink LIKE ? or 
		field_pressboard LIKE ? or 
		where_used_product LIKE ? or 
		where_used_plant LIKE ? or 
		remark LIKE ? or reason LIKE ?',
  		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%",
		"%#{query}%","%#{query}%","%#{query}%",
	)
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |ac_motor|
  	  	csv << ac_motor.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","arm_part_no","motor_size","armature_drw","field_part_no","field_drw","voltage","power","amps_rating","output_rpm","rotation",
	 "no_load_rpm_motor","gear_ratio","arm_wire_dia","field_wire_dia","winding_type","arm_resistance","displace_angle","arm_no_of_turns",
		"field_no_of_turns","field_resistance","field_wind_drw","arm_package","shaft_part_no","shaft_drw","arm_stack","arm_laminate",
		"field_stack","field_stack_opt","arm_end_lami","molding_comp","commutator","arm_copper_wire","arm_wire_drw","field_copper_wire",
		"arm_fan","insulating_tube","insulator","hard_paper_tube","slot_insulation","slot_wedge","pressboard","field_insulation_paper",
		"connection_plate","conn_plate_opt","end_plate","end_plate_opt","polyester_resin","resin_hardener","hardener_adhesive","impregnating_resin",
		"impreg_hardener","receptacle_01","receptacle_02","field_impregn_resin","field_resin_hard","filed_coating","field_heat_sink",
		"field_pressboard","where_used_product","where_used_plant","remark","reason"]
  end

  def init 
    self.release_status ||= "released"
  end

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by,
		:with_arm_part_no,
		:with_motor_size,
		:with_armature_drw,
		:with_field_part_no,
		:with_field_drw,
		:with_voltage,
		:with_power,
		:with_amps_rating,
		:with_output_rpm,
		:with_rotation,
		:with_no_load_rpm_motor,
		:with_gear_ratio,
		:with_arm_wire_dia,
		:with_field_wire_dia,
		:with_winding_type,
		:with_arm_resistance,
		:with_displace_angle,
		:with_arm_no_of_turns,
		:with_field_no_of_turns,
		:with_field_resistance,
		:with_field_wind_drw,
		:with_arm_package,
		:with_shaft_part_no,
		:with_shaft_drw,
		:with_arm_stack,
		:with_arm_laminate,
		:with_field_stack,
		:with_field_stack_opt,
		:with_arm_end_lami,
		:with_molding_comp,
		:with_commutator,
		:with_arm_copper_wire,
		:with_arm_wire_drw,
		:with_field_copper_wire,
		:with_arm_fan,
		:with_insulating_tube,
		:with_insulator,
		:with_hard_paper_tube,
		:with_slot_insulation,
		:with_slot_wedge,
		:with_pressboard,
		:with_field_insulation_paper,
		:with_connection_plate,
		:with_conn_plate_opt,
		:with_end_plate,
		:with_end_plate_opt,
		:with_polyester_resin,
		:with_resin_hardener,
		:with_hardener_adhesive,
		:with_impregnating_resin,
		:with_impreg_hardener,
		:with_receptacle_01,
		:with_receptacle_02,
		:with_field_impregn_resin,
		:with_field_resin_hard,
		:with_filed_coating,
		:with_field_heat_sink,
		:with_field_pressboard,
		:with_where_used_product,
		:with_where_used_plant,
		:with_remark,
		:with_reason,]
    )

  def self.options_for_sorted_by
      [
        ['Submission date (newest first)', 'created_at_desc'],
        ['Submission date (oldest first)', 'created_at_asc'],
        ['partnumber (larger number first)','partnumber_at_desc'],
        ['partnumber (smaller number first)','partnumber_at_asc'],
      ]
  end


	def self.arm_part_nos_for_select
		order('LOWER(arm_part_no)').map { |e| [e.arm_part_no, e.arm_part_no]}.uniq
	end
	
	def self.motor_sizes_for_select
		order('LOWER(motor_size)').map { |e| [e.motor_size, e.motor_size]}.uniq
	end

	def self.armature_drws_for_select
		order('LOWER(armature_drw)').map { |e| [e.armature_drw, e.armature_drw]}.uniq
	end

	def self.field_part_nos_for_select
		order('LOWER(field_part_no)').map { |e| [e.field_part_no, e.field_part_no]}.uniq
	end

	def self.field_drws_for_select
		order('LOWER(field_drw)').map { |e| [e.field_drw, e.field_drw]}.uniq
	end

	def self.voltages_for_select
		order('LOWER(voltage)').map { |e| [e.voltage, e.voltage]}.uniq
	end

	def self.powers_for_select
		order('LOWER(power)').map { |e| [e.power, e.power]}.uniq
	end

	def self.amps_ratings_for_select
		order('LOWER(amps_rating)').map { |e| [e.amps_rating, e.amps_rating]}.uniq
	end

	def self.output_rpms_for_select
		order('LOWER(output_rpm)').map { |e| [e.output_rpm, e.output_rpm]}.uniq
	end

	def self.rotations_for_select
		order('LOWER(rotation)').map { |e| [e.rotation, e.rotation]}.uniq
	end

	def self.no_load_rpm_motors_for_select
		order('LOWER(no_load_rpm_motor)').map { |e| [e.no_load_rpm_motor, e.no_load_rpm_motor]}.uniq
	end

	def self.gear_ratios_for_select
		order('LOWER(gear_ratio)').map { |e| [e.gear_ratio, e.gear_ratio]}.uniq
	end

	def self.arm_wire_dias_for_select
		order('LOWER(arm_wire_dia)').map { |e| [e.arm_wire_dia, e.arm_wire_dia]}.uniq
	end

	def self.field_wire_dias_for_select
		order('LOWER(field_wire_dia)').map { |e| [e.field_wire_dia, e.field_wire_dia]}.uniq
	end

	def self.winding_types_for_select
		order('LOWER(winding_type)').map { |e| [e.winding_type, e.winding_type]}.uniq
	end

	def self.arm_resistances_for_select
		order('LOWER(arm_resistance)').map { |e| [e.arm_resistance, e.arm_resistance]}.uniq
	end

	def self.displace_angles_for_select
		order('LOWER(displace_angle)').map { |e| [e.displace_angle, e.displace_angle]}.uniq
	end

	def self.arm_no_of_turnss_for_select
		order('LOWER(arm_no_of_turns)').map { |e| [e.arm_no_of_turns, e.arm_no_of_turns]}.uniq
	end

	def self.field_no_of_turnss_for_select
		order('LOWER(field_no_of_turns)').map { |e| [e.field_no_of_turns, e.field_no_of_turns]}.uniq
	end

	def self.field_resistances_for_select
		order('LOWER(field_resistance)').map { |e| [e.field_resistance, e.field_resistance]}.uniq
	end

	def self.field_wind_drws_for_select
		order('LOWER(field_wind_drw)').map { |e| [e.field_wind_drw, e.field_wind_drw]}.uniq
	end

	def self.arm_packages_for_select
		order('LOWER(arm_package)').map { |e| [e.arm_package, e.arm_package]}.uniq
	end

	def self.shaft_part_nos_for_select
		order('LOWER(shaft_part_no)').map { |e| [e.shaft_part_no, e.shaft_part_no]}.uniq
	end

	def self.shaft_drws_for_select
		order('LOWER(shaft_drw)').map { |e| [e.shaft_drw, e.shaft_drw]}.uniq
	end

	def self.arm_stacks_for_select
		order('LOWER(arm_stack)').map { |e| [e.arm_stack, e.arm_stack]}.uniq
	end

	def self.arm_laminates_for_select
		order('LOWER(arm_laminate)').map { |e| [e.arm_laminate, e.arm_laminate]}.uniq
	end

	def self.field_stacks_for_select
		order('LOWER(field_stack)').map { |e| [e.field_stack, e.field_stack]}.uniq
	end

	def self.field_stack_opts_for_select
		order('LOWER(field_stack_opt)').map { |e| [e.field_stack_opt, e.field_stack_opt]}.uniq
	end

	def self.arm_end_lamis_for_select
		order('LOWER(arm_end_lami)').map { |e| [e.arm_end_lami, e.arm_end_lami]}.uniq
	end

	def self.molding_comps_for_select
		order('LOWER(molding_comp)').map { |e| [e.molding_comp, e.molding_comp]}.uniq
	end

	def self.commutators_for_select
		order('LOWER(commutator)').map { |e| [e.commutator, e.commutator]}.uniq
	end

	def self.arm_copper_wires_for_select
		order('LOWER(arm_copper_wire)').map { |e| [e.arm_copper_wire, e.arm_copper_wire]}.uniq
	end

	def self.arm_wire_drws_for_select
		order('LOWER(arm_wire_drw)').map { |e| [e.arm_wire_drw, e.arm_wire_drw]}.uniq
	end

	def self.field_copper_wires_for_select
		order('LOWER(field_copper_wire)').map { |e| [e.field_copper_wire, e.field_copper_wire]}.uniq
	end

	def self.arm_fans_for_select
		order('LOWER(arm_fan)').map { |e| [e.arm_fan, e.arm_fan]}.uniq
	end

	def self.insulating_tubes_for_select
		order('LOWER(insulating_tube)').map { |e| [e.insulating_tube, e.insulating_tube]}.uniq
	end

	def self.insulators_for_select
		order('LOWER(insulator)').map { |e| [e.insulator, e.insulator]}.uniq
	end

	def self.hard_paper_tubes_for_select
		order('LOWER(hard_paper_tube)').map { |e| [e.hard_paper_tube, e.hard_paper_tube]}.uniq
	end

	def self.slot_insulations_for_select
		order('LOWER(slot_insulation)').map { |e| [e.slot_insulation, e.slot_insulation]}.uniq
	end

	def self.slot_wedges_for_select
		order('LOWER(slot_wedge)').map { |e| [e.slot_wedge, e.slot_wedge]}.uniq
	end

	def self.pressboards_for_select
		order('LOWER(pressboard)').map { |e| [e.pressboard, e.pressboard]}.uniq
	end

	def self.field_insulation_papers_for_select
		order('LOWER(field_insulation_paper)').map { |e| [e.field_insulation_paper, e.field_insulation_paper]}.uniq
	end

	def self.connection_plates_for_select
		order('LOWER(connection_plate)').map { |e| [e.connection_plate, e.connection_plate]}.uniq
	end

	def self.conn_plate_opts_for_select
		order('LOWER(conn_plate_opt)').map { |e| [e.conn_plate_opt, e.conn_plate_opt]}.uniq
	end

	def self.end_plates_for_select
		order('LOWER(end_plate)').map { |e| [e.end_plate, e.end_plate]}.uniq
	end
	
	def self.end_plate_opts_for_select
		order('LOWER(end_plate_opt)').map { |e| [e.end_plate_opt, e.end_plate_opt]}.uniq
	end

	def self.polyester_resins_for_select
		order('LOWER(polyester_resin)').map { |e| [e.polyester_resin, e.polyester_resin]}.uniq
	end

	def self.resin_hardeners_for_select
		order('LOWER(resin_hardener)').map { |e| [e.resin_hardener, e.resin_hardener]}.uniq
	end

	def self.hardener_adhesives_for_select
		order('LOWER(hardener_adhesive)').map { |e| [e.hardener_adhesive, e.hardener_adhesive]}.uniq
	end

	def self.impregnating_resins_for_select
		order('LOWER(impregnating_resin)').map { |e| [e.impregnating_resin, e.impregnating_resin]}.uniq
	end

	def self.impreg_hardeners_for_select
		order('LOWER(impreg_hardener)').map { |e| [e.impreg_hardener, e.impreg_hardener]}.uniq
	end

	def self.receptacle_01s_for_select
		order('LOWER(receptacle_01)').map { |e| [e.receptacle_01, e.receptacle_01]}.uniq
	end

	def self.receptacle_02s_for_select
		order('LOWER(receptacle_02)').map { |e| [e.receptacle_02, e.receptacle_02]}.uniq
	end

	def self.field_impregn_resins_for_select
		order('LOWER(field_impregn_resin)').map { |e| [e.field_impregn_resin, e.field_impregn_resin]}.uniq
	end

	def self.field_resin_hards_for_select
		order('LOWER(field_resin_hard)').map { |e| [e.field_resin_hard, e.field_resin_hard]}.uniq
	end

	def self.filed_coatings_for_select
		order('LOWER(filed_coating)').map { |e| [e.filed_coating, e.filed_coating]}.uniq
	end

	def self.field_heat_sinks_for_select
		order('LOWER(field_heat_sink)').map { |e| [e.field_heat_sink, e.field_heat_sink]}.uniq
	end

	def self.field_pressboards_for_select
		order('LOWER(field_pressboard)').map { |e| [e.field_pressboard, e.field_pressboard]}.uniq
	end

	def self.where_used_products_for_select
		order('LOWER(where_used_product)').map { |e| [e.where_used_product, e.where_used_product]}.uniq
	end

	def self.where_used_plants_for_select
		order('LOWER(where_used_plant)').map { |e| [e.where_used_plant, e.where_used_plant]}.uniq
	end

	def self.remarks_for_select
		order('LOWER(remark)').map { |e| [e.remark, e.remark]}.uniq
	end

  	def self.reasons_for_select
    	order('LOWER(reason)').map { |e| [e.reason, e.reason] }.uniq
  	end

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
    	order("ac_motors.created_at #{ direction }")
	when /^arm_part_no_/	
		order('LOWER(ac_motors.arm_part_no) #{ direction }')
	when /^motor_size_/	
		order('LOWER(ac_motors.motor_size) #{ direction }')
	when /^armature_drw_/	
		order('LOWER(ac_motors.armature_drw) #{ direction }')
	when /^field_part_no_/	
		order('LOWER(ac_motors.field_part_no) #{ direction }')
	when /^field_drw_/	
		order('LOWER(ac_motors.field_drw) #{ direction }')
	when /^voltage_/	
		order('LOWER(ac_motors.voltage) #{ direction }')
	when /^power_/	
		order('LOWER(ac_motors.power) #{ direction }')
	when /^amps_rating_/	
		order('LOWER(ac_motors.amps_rating) #{ direction }')
	when /^output_rpm_/	
		order('LOWER(ac_motors.output_rpm) #{ direction }')
	when /^rotation_/	
		order('LOWER(ac_motors.rotation) #{ direction }')
	when /^no_load_rpm_motor_/	
		order('LOWER(ac_motors.no_load_rpm_motor) #{ direction }')
	when /^gear_ratio_/	
		order('LOWER(ac_motors.gear_ratio) #{ direction }')
	when /^arm_wire_dia_/	
		order('LOWER(ac_motors.arm_wire_dia) #{ direction }')
	when /^field_wire_dia_/	
		order('LOWER(ac_motors.field_wire_dia) #{ direction }')
	when /^winding_type_/	
		order('LOWER(ac_motors.winding_type) #{ direction }')
	when /^arm_resistance_/	
		order('LOWER(ac_motors.arm_resistance) #{ direction }')
	when /^displace_angle_/	
		order('LOWER(ac_motors.displace_angle) #{ direction }')
	when /^arm_no_of_turns_/	
		order('LOWER(ac_motors.arm_no_of_turns) #{ direction }')
	when /^field_no_of_turns_/	
		order('LOWER(ac_motors.field_no_of_turns) #{ direction }')
	when /^field_resistance_/	
		order('LOWER(ac_motors.field_resistance) #{ direction }')
	when /^field_wind_drw_/	
		order('LOWER(ac_motors.field_wind_drw) #{ direction }')
	when /^arm_package_/	
		order('LOWER(ac_motors.arm_package) #{ direction }')
	when /^shaft_part_no_/	
		order('LOWER(ac_motors.shaft_part_no) #{ direction }')
	when /^shaft_drw_/	
		order('LOWER(ac_motors.shaft_drw) #{ direction }')
	when /^arm_stack_/	
		order('LOWER(ac_motors.arm_stack) #{ direction }')
	when /^arm_laminate_/	
		order('LOWER(ac_motors.arm_laminate) #{ direction }')
	when /^field_stack_/	
		order('LOWER(ac_motors.field_stack) #{ direction }')
	when /^field_stack_opt_/	
		order('LOWER(ac_motors.field_stack_opt) #{ direction }')
	when /^arm_end_lami_/	
		order('LOWER(ac_motors.arm_end_lami) #{ direction }')
	when /^molding_comp_/	
		order('LOWER(ac_motors.molding_comp) #{ direction }')
	when /^commutator_/	
		order('LOWER(ac_motors.commutator) #{ direction }')
	when /^arm_copper_wire_/	
		order('LOWER(ac_motors.arm_copper_wire) #{ direction }')
	when /^arm_wire_drw_/	
		order('LOWER(ac_motors.arm_wire_drw) #{ direction }')
	when /^field_copper_wire_/	
		order('LOWER(ac_motors.field_copper_wire) #{ direction }')
	when /^arm_fan_/	
		order('LOWER(ac_motors.arm_fan) #{ direction }')
	when /^insulating_tube_/	
		order('LOWER(ac_motors.insulating_tube) #{ direction }')
	when /^insulator_/	
		order('LOWER(ac_motors.insulator) #{ direction }')
	when /^hard_paper_tube_/	
		order('LOWER(ac_motors.hard_paper_tube) #{ direction }')
	when /^slot_insulation_/	
		order('LOWER(ac_motors.slot_insulation) #{ direction }')
	when /^slot_wedge_/	
		order('LOWER(ac_motors.slot_wedge) #{ direction }')
	when /^pressboard_/	
		order('LOWER(ac_motors.pressboard) #{ direction }')
	when /^field_insulation_paper_/	
		order('LOWER(ac_motors.field_insulation_paper) #{ direction }')
	when /^connection_plate_/	
		order('LOWER(ac_motors.connection_plate) #{ direction }')
	when /^conn_plate_opt_/	
		order('LOWER(ac_motors.conn_plate_opt) #{ direction }')
	when /^end_plate_/	
		order('LOWER(ac_motors.end_plate) #{ direction }')
	when /^end_plate_opt_/	
		order('LOWER(ac_motors.end_plate_opt) #{ direction }')
	when /^polyester_resin_/	
		order('LOWER(ac_motors.polyester_resin) #{ direction }')
	when /^resin_hardener_/	
		order('LOWER(ac_motors.resin_hardener) #{ direction }')
	when /^hardener_adhesive_/	
		order('LOWER(ac_motors.hardener_adhesive) #{ direction }')
	when /^impregnating_resin_/	
		order('LOWER(ac_motors.impregnating_resin) #{ direction }')
	when /^impreg_hardener_/	
		order('LOWER(ac_motors.impreg_hardener) #{ direction }')
	when /^receptacle_01_/	
		order('LOWER(ac_motors.receptacle_01) #{ direction }')
	when /^receptacle_02_/	
		order('LOWER(ac_motors.receptacle_02) #{ direction }')
	when /^field_impregn_resin_/	
		order('LOWER(ac_motors.field_impregn_resin) #{ direction }')
	when /^field_resin_hard_/	
		order('LOWER(ac_motors.field_resin_hard) #{ direction }')
	when /^filed_coating_/	
		order('LOWER(ac_motors.filed_coating) #{ direction }')
	when /^field_heat_sink_/	
		order('LOWER(ac_motors.field_heat_sink) #{ direction }')
	when /^field_pressboard_/	
		order('LOWER(ac_motors.field_pressboard) #{ direction }')
	when /^where_used_product_/	
		order('LOWER(ac_motors.where_used_product) #{ direction }')
	when /^where_used_plant_/	
		order('LOWER(ac_motors.where_used_plant) #{ direction }')
	when /^remark_/	
		order('LOWER(ac_motors.remark) #{ direction }')
	when /^reason_/	
		order("LOWER(ac_motors.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }

scope :with_arm_part_no, lambda { |arm_part_nos| where(arm_part_no: [*arm_part_nos]) }
scope :with_motor_size, lambda { |motor_sizes| where(motor_size: [*motor_sizes]) }
scope :with_armature_drw, lambda { |armature_drws| where(armature_drw: [*armature_drws]) }
scope :with_field_part_no, lambda { |field_part_nos| where(field_part_no: [*field_part_nos]) }
scope :with_field_drw, lambda { |field_drws| where(field_drw: [*field_drws]) }
scope :with_voltage, lambda { |voltages| where(voltage: [*voltages]) }
scope :with_power, lambda { |powers| where(power: [*powers]) }
scope :with_amps_rating, lambda { |amps_ratings| where(amps_rating: [*amps_ratings]) }
scope :with_output_rpm, lambda { |output_rpms| where(output_rpm: [*output_rpms]) }
scope :with_rotation, lambda { |rotations| where(rotation: [*rotations]) }
scope :with_no_load_rpm_motor, lambda { |no_load_rpm_motors| where(no_load_rpm_motor: [*no_load_rpm_motors]) }
scope :with_gear_ratio, lambda { |gear_ratios| where(gear_ratio: [*gear_ratios]) }
scope :with_arm_wire_dia, lambda { |arm_wire_dias| where(arm_wire_dia: [*arm_wire_dias]) }
scope :with_field_wire_dia, lambda { |field_wire_dias| where(field_wire_dia: [*field_wire_dias]) }
scope :with_winding_type, lambda { |winding_types| where(winding_type: [*winding_types]) }
scope :with_arm_resistance, lambda { |arm_resistances| where(arm_resistance: [*arm_resistances]) }
scope :with_displace_angle, lambda { |displace_angles| where(displace_angle: [*displace_angles]) }
scope :with_arm_no_of_turns, lambda { |arm_no_of_turnss| where(arm_no_of_turns: [*arm_no_of_turnss]) }
scope :with_field_no_of_turns, lambda { |field_no_of_turnss| where(field_no_of_turns: [*field_no_of_turnss]) }
scope :with_field_resistance, lambda { |field_resistances| where(field_resistance: [*field_resistances]) }
scope :with_field_wind_drw, lambda { |field_wind_drws| where(field_wind_drw: [*field_wind_drws]) }
scope :with_arm_package, lambda { |arm_packages| where(arm_package: [*arm_packages]) }
scope :with_shaft_part_no, lambda { |shaft_part_nos| where(shaft_part_no: [*shaft_part_nos]) }
scope :with_shaft_drw, lambda { |shaft_drws| where(shaft_drw: [*shaft_drws]) }
scope :with_arm_stack, lambda { |arm_stacks| where(arm_stack: [*arm_stacks]) }
scope :with_arm_laminate, lambda { |arm_laminates| where(arm_laminate: [*arm_laminates]) }
scope :with_field_stack, lambda { |field_stacks| where(field_stack: [*field_stacks]) }
scope :with_field_stack_opt, lambda { |field_stack_opts| where(field_stack_opt: [*field_stack_opts]) }
scope :with_arm_end_lami, lambda { |arm_end_lamis| where(arm_end_lami: [*arm_end_lamis]) }
scope :with_molding_comp, lambda { |molding_comps| where(molding_comp: [*molding_comps]) }
scope :with_commutator, lambda { |commutators| where(commutator: [*commutators]) }
scope :with_arm_copper_wire, lambda { |arm_copper_wires| where(arm_copper_wire: [*arm_copper_wires]) }
scope :with_arm_wire_drw, lambda { |arm_wire_drws| where(arm_wire_drw: [*arm_wire_drws]) }
scope :with_field_copper_wire, lambda { |field_copper_wires| where(field_copper_wire: [*field_copper_wires]) }
scope :with_arm_fan, lambda { |arm_fans| where(arm_fan: [*arm_fans]) }
scope :with_insulating_tube, lambda { |insulating_tubes| where(insulating_tube: [*insulating_tubes]) }
scope :with_insulator, lambda { |insulators| where(insulator: [*insulators]) }
scope :with_hard_paper_tube, lambda { |hard_paper_tubes| where(hard_paper_tube: [*hard_paper_tubes]) }
scope :with_slot_insulation, lambda { |slot_insulations| where(slot_insulation: [*slot_insulations]) }
scope :with_slot_wedge, lambda { |slot_wedges| where(slot_wedge: [*slot_wedges]) }
scope :with_pressboard, lambda { |pressboards| where(pressboard: [*pressboards]) }
scope :with_field_insulation_paper, lambda { |field_insulation_papers| where(field_insulation_paper: [*field_insulation_papers]) }
scope :with_connection_plate, lambda { |connection_plates| where(connection_plate: [*connection_plates]) }
scope :with_conn_plate_opt, lambda { |conn_plate_opts| where(conn_plate_opt: [*conn_plate_opts]) }
scope :with_end_plate, lambda { |end_plates| where(end_plate: [*end_plates]) }
scope :with_end_plate_opt, lambda { |end_plate_opts| where(end_plate_opt: [*end_plate_opts]) }
scope :with_polyester_resin, lambda { |polyester_resins| where(polyester_resin: [*polyester_resins]) }
scope :with_resin_hardener, lambda { |resin_hardeners| where(resin_hardener: [*resin_hardeners]) }
scope :with_hardener_adhesive, lambda { |hardener_adhesives| where(hardener_adhesive: [*hardener_adhesives]) }
scope :with_impregnating_resin, lambda { |impregnating_resins| where(impregnating_resin: [*impregnating_resins]) }
scope :with_impreg_hardener, lambda { |impreg_hardeners| where(impreg_hardener: [*impreg_hardeners]) }
scope :with_receptacle_01, lambda { |receptacle_01s| where(receptacle_01: [*receptacle_01s]) }
scope :with_receptacle_02, lambda { |receptacle_02s| where(receptacle_02: [*receptacle_02s]) }
scope :with_field_impregn_resin, lambda { |field_impregn_resins| where(field_impregn_resin: [*field_impregn_resins]) }
scope :with_field_resin_hard, lambda { |field_resin_hards| where(field_resin_hard: [*field_resin_hards]) }
scope :with_filed_coating, lambda { |filed_coatings| where(filed_coating: [*filed_coatings]) }
scope :with_field_heat_sink, lambda { |field_heat_sinks| where(field_heat_sink: [*field_heat_sinks]) }
scope :with_field_pressboard, lambda { |field_pressboards| where(field_pressboard: [*field_pressboards]) }
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products]) }
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants]) }
scope :with_remark, lambda { |remarks| where(remark: [*remarks]) }
scope :with_reason, lambda { |reasons| where(reason: [*reasons]) }


scope :search_query, lambda { |query|
  return nil  if query.blank?
  # condition query, parse into individual keywords
  #terms = query.downcase.split(/\s+/)
  if query.is_a? String
    terms = query.downcase
    terms = (terms.gsub('*', '%') + '%').gsub(/%+/, '%')
  else
    terms =  query
  end

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  # terms = terms.map { |e|
  #   (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  # }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  # num_or_conds = 16


  where(
  	"LOWER(ac_motors.arm_part_no) LIKE ? OR
	LOWER(ac_motors.motor_size) LIKE ? OR
	LOWER(ac_motors.armature_drw) LIKE ? OR
	LOWER(ac_motors.field_part_no) LIKE ? OR
	LOWER(ac_motors.field_drw) LIKE ? OR
	LOWER(ac_motors.voltage) LIKE ? OR
	LOWER(ac_motors.power) LIKE ? OR
	LOWER(ac_motors.amps_rating) LIKE ? OR
	LOWER(ac_motors.output_rpm) LIKE ? OR
	LOWER(ac_motors.rotation) LIKE ? OR
	LOWER(ac_motors.no_load_rpm_motor) LIKE ? OR
	LOWER(ac_motors.gear_ratio) LIKE ? OR
	LOWER(ac_motors.arm_wire_dia) LIKE ? OR
	LOWER(ac_motors.field_wire_dia) LIKE ? OR
	LOWER(ac_motors.winding_type) LIKE ? OR
	LOWER(ac_motors.arm_resistance) LIKE ? OR
	LOWER(ac_motors.displace_angle) LIKE ? OR
	LOWER(ac_motors.arm_no_of_turns) LIKE ? OR
	LOWER(ac_motors.field_no_of_turns) LIKE ? OR
	LOWER(ac_motors.field_resistance) LIKE ? OR
	LOWER(ac_motors.field_wind_drw) LIKE ? OR
	LOWER(ac_motors.arm_package) LIKE ? OR
	LOWER(ac_motors.shaft_part_no) LIKE ? OR
	LOWER(ac_motors.shaft_drw) LIKE ? OR
	LOWER(ac_motors.arm_stack) LIKE ? OR
	LOWER(ac_motors.arm_laminate) LIKE ? OR
	LOWER(ac_motors.field_stack) LIKE ? OR
	LOWER(ac_motors.field_stack_opt) LIKE ? OR
	LOWER(ac_motors.arm_end_lami) LIKE ? OR
	LOWER(ac_motors.molding_comp) LIKE ? OR
	LOWER(ac_motors.commutator) LIKE ? OR
	LOWER(ac_motors.arm_copper_wire) LIKE ? OR
	LOWER(ac_motors.arm_wire_drw) LIKE ? OR
	LOWER(ac_motors.field_copper_wire) LIKE ? OR
	LOWER(ac_motors.arm_fan) LIKE ? OR
	LOWER(ac_motors.insulating_tube) LIKE ? OR
	LOWER(ac_motors.insulator) LIKE ? OR
	LOWER(ac_motors.hard_paper_tube) LIKE ? OR
	LOWER(ac_motors.slot_insulation) LIKE ? OR
	LOWER(ac_motors.slot_wedge) LIKE ? OR
	LOWER(ac_motors.pressboard) LIKE ? OR
	LOWER(ac_motors.field_insulation_paper) LIKE ? OR
	LOWER(ac_motors.connection_plate) LIKE ? OR
	LOWER(ac_motors.conn_plate_opt) LIKE ? OR
	LOWER(ac_motors.end_plate) LIKE ? OR
	LOWER(ac_motors.end_plate_opt) LIKE ? OR
	LOWER(ac_motors.polyester_resin) LIKE ? OR
	LOWER(ac_motors.resin_hardener) LIKE ? OR
	LOWER(ac_motors.hardener_adhesive) LIKE ? OR
	LOWER(ac_motors.impregnating_resin) LIKE ? OR
	LOWER(ac_motors.impreg_hardener) LIKE ? OR
	LOWER(ac_motors.receptacle_01) LIKE ? OR
	LOWER(ac_motors.receptacle_02) LIKE ? OR
	LOWER(ac_motors.field_impregn_resin) LIKE ? OR
	LOWER(ac_motors.field_resin_hard) LIKE ? OR
	LOWER(ac_motors.filed_coating) LIKE ? OR
	LOWER(ac_motors.field_heat_sink) LIKE ? OR
	LOWER(ac_motors.field_pressboard) LIKE ? OR
	LOWER(ac_motors.where_used_product) LIKE ? OR
	LOWER(ac_motors.where_used_plant) LIKE ? OR
	LOWER(ac_motors.remark) LIKE ? OR
	LOWER(ac_motors.reason) LIKE ? ",
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms,terms,terms,terms,terms,terms,terms,terms,terms,
	terms,terms)
}

end


