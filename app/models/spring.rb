class Spring < ActiveRecord::Base
   include ValidateMethods
   include CommonConstants
    
  	after_initialize :init



    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? or spring_type LIKE ? 
        or material_dia LIKE ? or mean_dia LIKE ? or free_length LIKE ? or no_of_active_coils LIKE ? 
        or solid_length_max LIKE ? or dimension_f1 LIKE ? or dimension_l1 LIKE ? or dimension_f2 LIKE ? 
        or dimension_l2 LIKE ? or initial_load_nm ? or final_load_nm LIKE ? or torque_arm_length LIKE ? 
        or hook_length LIKE ? or hook_arc_radius LIKE ? or spring_constant LIKE ? or unit LIKE ? 
        or supplier LIKE ? or drawing_norm LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ? 
        or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", 
      "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |spring|
  	  	csv << spring.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","spring_type","material_dia","mean_dia","free_length","no_of_active_coils",
    	"solid_length_max", "dimension_f1", "dimension_l1", "dimension_f2","dimension_l2",
    	"initial_load_nm","final_load_nm","torque_arm_length","hook_length","hook_arc_radius",
    	"spring_constant","unit","supplier",
    	"drawing_norm","where_used_product","where_used_plant","remark", "reason"]
  end

  def init 
    self.release_status ||= "released"
  end

  filterrific(
default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by,
      :with_partnumber,
      :with_description,
      :with_spring_type,
      :with_material_dia,
      :with_mean_dia,
      :with_free_length,
      :with_no_of_active_coils,
      :with_solid_length_max,
      :with_dimension_f1,
      :with_dimension_l1,
      :with_dimension_f2,
      :with_dimension_l2,
      :with_initial_load_nm,
      :with_final_load_nm,
      :with_torque_arm_length,
      :with_hook_length,
      :with_hook_arc_radius,
      :with_spring_constant,
      :with_unit,
      :with_supplier,
      :with_drawing_norm,
      :with_where_used_product,
      :with_where_used_plant,
      :with_remark,
      :with_reason,
    ]
    )

  def self.options_for_sorted_by
      [
        ['Submission date (newest first)', 'created_at_desc'],
        ['Submission date (oldest first)', 'created_at_asc'],
        ['partnumber (larger number first)','partnumber_at_desc'],
        ['partnumber (smaller number first)','partnumber_at_asc'],
      ]
  end

  def self.partnumbers_for_select
    order('LOWER(partnumber)').map { |e| [e.partnumber, e.partnumber] }.uniq
  end

  def self.descriptions_for_select
    order('LOWER(description)').map { |e| [e.description, e.description] }.uniq
  end

  def self.spring_types_for_select
    order('LOWER(spring_type)').map { |e| [e.spring_type, e.spring_type] }.uniq
  end

  def self.material_dias_for_select
    order('LOWER(material_dia)').map { |e| [e.material_dia, e.material_dia] }.uniq
  end

  def self.mean_dias_for_select
    order('LOWER(mean_dia)').map { |e| [e.mean_dia, e.mean_dia] }.uniq
  end

  def self.free_lengths_for_select
    order('LOWER(free_length)').map { |e| [e.free_length, e.free_length] }.uniq
  end

  def self.no_of_active_coilss_for_select
    order('LOWER(no_of_active_coils)').map { |e| [e.no_of_active_coils, e.no_of_active_coils] }.uniq
  end

  def self.solid_length_maxs_for_select
    order('LOWER(solid_length_max)').map { |e| [e.solid_length_max, e.solid_length_max] }.uniq
  end

  def self.dimension_f1s_for_select
    order('LOWER(dimension_f1)').map { |e| [e.dimension_f1, e.dimension_f1] }.uniq
  end

  def self.dimension_l1s_for_select
    order('LOWER(dimension_l1)').map { |e| [e.dimension_l1, e.dimension_l1] }.uniq
  end

  def self.dimension_f2s_for_select
    order('LOWER(dimension_f2)').map { |e| [e.dimension_f2, e.dimension_f2] }.uniq
  end

  def self.dimension_l2s_for_select
    order('LOWER(dimension_l2)').map { |e| [e.dimension_l2, e.dimension_l2] }.uniq
  end

  def self.initial_load_nms_for_select
    order('LOWER(initial_load_nm)').map { |e| [e.initial_load_nm, e.initial_load_nm] }.uniq
  end

  def self.final_load_nms_for_select
    order('LOWER(final_load_nm)').map { |e| [e.final_load_nm, e.final_load_nm] }.uniq
  end

  def self.torque_arm_lengths_for_select
    order('LOWER(torque_arm_length)').map { |e| [e.torque_arm_length, e.torque_arm_length] }.uniq
  end

  def self.hook_lengths_for_select
    order('LOWER(hook_length)').map { |e| [e.hook_length, e.hook_length] }.uniq
  end

  def self.hook_arc_radiuss_for_select
    order('LOWER(hook_arc_radius)').map { |e| [e.hook_arc_radius, e.hook_arc_radius] }.uniq
  end

  def self.spring_constants_for_select
    order('LOWER(spring_constant)').map { |e| [e.spring_constant, e.spring_constant] }.uniq
  end

  def self.units_for_select
    order('LOWER(unit)').map { |e| [e.unit, e.unit] }.uniq
  end

  def self.suppliers_for_select
    order('LOWER(supplier)').map { |e| [e.supplier, e.supplier] }.uniq
  end

  def self.drawing_norms_for_select
    order('LOWER(drawing_norm)').map { |e| [e.drawing_norm, e.drawing_norm] }.uniq
  end

  def self.where_used_products_for_select
    order('LOWER(where_used_product)').map { |e| [e.where_used_product, e.where_used_product] }.uniq
  end

  def self.where_used_plants_for_select
    order('LOWER(where_used_plant)').map { |e| [e.where_used_plant, e.where_used_plant] }.uniq
  end

  def self.remarks_for_select
    order('LOWER(remark)').map { |e| [e.remark, e.remark] }.uniq
  end

  def self.reasons_for_select
    order('LOWER(reason)').map { |e| [e.reason, e.reason] }.uniq
  end
  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
    order("springs.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(springs.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(springs.description) #{ direction }")
    when /^spring_type_/
    order("LOWER(springs.spring_type) #{ direction }")
    when /^material_dia_/
    order("LOWER(springs.material_dia) #{ direction }")
    when /^mean_dia_/
    order("LOWER(springs.mean_dia) #{ direction }")
    when /^free_length_/
    order("LOWER(springs.free_length) #{ direction }")
    when /^no_of_active_coils_/
    order("LOWER(springs.no_of_active_coils) #{ direction }")
    when /^solid_length_max_/
    order("LOWER(springs.solid_length_max) #{ direction }")
    when /^dimension_f1_/
    order("LOWER(springs.dimension_f1) #{ direction }")
    when /^dimension_l1_/
    order("LOWER(springs.dimension_l1) #{ direction }")
    when /^dimension_f2_/
    order("LOWER(springs.dimension_f2) #{ direction }")
    when /^dimension_l2_/
    order("LOWER(springs.dimension_l2) #{ direction }")
    when /^initial_load_nm_/
    order("LOWER(springs.initial_load_nm) #{ direction }")
    when /^final_load_nm_/
    order("LOWER(springs.final_load_nm) #{ direction }")
    when /^torque_arm_length_/
    order("LOWER(springs.torque_arm_length) #{ direction }")
    when /^hook_length_/
    order("LOWER(springs.hook_length) #{ direction }")
    when /^hook_arc_radius_/
    order("LOWER(springs.hook_arc_radius) #{ direction }")
    when /^spring_constant_/
    order("LOWER(springs.spring_constant) #{ direction }")
    when /^unit_/
    order("LOWER(springs.unit) #{ direction }")
    when /^supplier_/
    order("LOWER(springs.supplier) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(springs.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(springs.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(springs.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(springs.remark) #{ direction }")
    when /^reason_/
    order("LOWER(springs.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_spring_type, lambda { |spring_types| where(spring_type: [*spring_types])}
scope :with_material_dia, lambda { |material_dias| where(material_dia: [*material_dias])}
scope :with_mean_dia, lambda { |mean_dias| where(mean_dia: [*mean_dias])}
scope :with_free_length, lambda { |free_lengths| where(free_length: [*free_lengths])}
scope :with_no_of_active_coils, lambda { |no_of_active_coilss| where(no_of_active_coils: [*no_of_active_coilss])}
scope :with_solid_length_max, lambda { |solid_length_maxs| where(solid_length_max: [*solid_length_maxs])}
scope :with_dimension_f1, lambda { |dimension_f1s| where(dimension_f1: [*dimension_f1s])}
scope :with_dimension_l1, lambda { |dimension_l1s| where(dimension_l1: [*dimension_l1s])}
scope :with_dimension_f2, lambda { |dimension_f2s| where(dimension_f2: [*dimension_f2s])}
scope :with_dimension_l2, lambda { |dimension_l2s| where(dimension_l2: [*dimension_l2s])}
scope :with_initial_load_nm, lambda { |initial_load_nms| where(initial_load_nm: [*initial_load_nms])}
scope :with_final_load_nm, lambda { |final_load_nms| where(final_load_nm: [*final_load_nms])}
scope :with_torque_arm_length, lambda { |torque_arm_lengths| where(torque_arm_length: [*torque_arm_lengths])}
scope :with_hook_length, lambda { |hook_lengths| where(hook_length: [*hook_lengths])}
scope :with_hook_arc_radius, lambda { |hook_arc_radiuss| where(hook_arc_radius: [*hook_arc_radiuss])}
scope :with_spring_constant, lambda { |spring_constants| where(spring_constant: [*spring_constants])}
scope :with_unit, lambda { |units| where(unit: [*units])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :with_remark, lambda { |remarks| where(remark: [*remarks])}
scope :with_reason, lambda { |reasons| where(reason: [*reasons])}


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
  where("LOWER(springs.partnumber) LIKE ? OR LOWER(springs.description) LIKE ?
         OR LOWER(springs.spring_type) LIKE ?
         OR LOWER(springs.material_dia) LIKE ? OR LOWER(springs.mean_dia) LIKE ?
          OR LOWER(springs.free_length) LIKE ? OR LOWER(springs.no_of_active_coils) LIKE ?
           OR LOWER(springs.solid_length_max) LIKE ?
           OR LOWER(springs.dimension_f1) LIKE ? OR LOWER(springs.dimension_l1) LIKE ?
            OR LOWER(springs.dimension_f2) LIKE ?
            OR LOWER(springs.dimension_l2) LIKE ?
             OR LOWER(springs.initial_load_nm) LIKE ? OR LOWER(springs.final_load_nm) LIKE ?
             OR LOWER(springs.torque_arm_length) LIKE ?
             OR LOWER(springs.hook_length) LIKE ? OR LOWER(springs.hook_arc_radius) LIKE ?
              OR LOWER(springs.spring_constant) LIKE ? OR LOWER(springs.unit) LIKE ?
               OR LOWER(springs.supplier) LIKE ?
               OR LOWER(springs.drawing_norm) LIKE ? OR LOWER(springs.where_used_product) LIKE ?
              OR LOWER(springs.where_used_plant) LIKE ?
              OR LOWER(springs.remark) LIKE ? OR LOWER(springs.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms)
}

end

