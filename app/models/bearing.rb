class Bearing < ActiveRecord::Base
    include ValidateMethods
    include CommonConstants
    
    after_initialize :init


    self.per_page = 15


  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or i_dia LIKE ? or o_dia LIKE ? or width LIKE ? or bearing_type LIKE ? 
        or bearing_no LIKE ? or radial_clearance_um LIKE ? or sealing LIKE ? 
        or max_speed_rpm LIKE ? or position_within_product LIKE ? or drawing_norm LIKE ? 
        or where_used_product LIKE ? or where_used_plant LIKE ? 
        or supplier LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |bearing|
  	  	csv << bearing.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","i_dia","o_dia","width","bearing_type","bearing_no",
    	"radial_clearance_um", "sealing", "max_speed_rpm", "position_within_product","drawing_norm",
    	"where_used_product","where_used_plant","supplier","remark", "reason"]
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
      :with_i_dia,
      :with_o_dia,
      :with_width,
      :with_bearing_type,
      :with_bearing_no,
      :with_radial_clearance_um,
      :with_sealing,
      :with_max_speed_rpm,
      :with_position_within_product,
      :with_drawing_norm,
      :with_where_used_product,
      :with_where_used_plant,
      :with_supplier,
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

  def self.i_dias_for_select
    order('LOWER(i_dia)').map { |e| [e.i_dia, e.i_dia] }.uniq
  end

  def self.o_dias_for_select
    order('LOWER(o_dia)').map { |e| [e.o_dia, e.o_dia] }.uniq
  end

  def self.widths_for_select
    order('LOWER(width)').map { |e| [e.width, e.width] }.uniq
  end

  def self.bearing_types_for_select
    order('LOWER(bearing_type)').map { |e| [e.bearing_type, e.bearing_type] }.uniq
  end

  def self.bearing_nos_for_select
    order('LOWER(bearing_no)').map { |e| [e.bearing_no, e.bearing_no] }.uniq
  end

  def self.radial_clearance_ums_for_select
    order('LOWER(radial_clearance_um)').map { |e| [e.radial_clearance_um, e.radial_clearance_um] }.uniq
  end

  def self.sealings_for_select
    order('LOWER(sealing)').map { |e| [e.sealing, e.sealing] }.uniq
  end

  def self.max_speed_rpms_for_select
    order('LOWER(max_speed_rpm)').map { |e| [e.max_speed_rpm, e.max_speed_rpm] }.uniq
  end

  def self.position_within_products_for_select
    order('LOWER(position_within_product)').map { |e| [e.position_within_product, e.position_within_product] }.uniq
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

  def self.suppliers_for_select
    order('LOWER(supplier)').map { |e| [e.supplier, e.supplier] }.uniq
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
    order("bearings.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(bearings.partnumber) #{ direction }")
    when /^descriptions_/
    order("LOWER(bearings.description) #{ direction }")
    when /^i_dia_/
    order("LOWER(bearings.i_dia) #{ direction }")
    when /^o_dia_/
    order("LOWER(bearings.o_dia) #{ direction }")
    when /^width_/
    order("LOWER(bearings.width) #{ direction }")
    when /^bearing_type_/
    order("LOWER(bearings.bearing_type) #{ direction }")
    when /^bearing_no_/
    order("LOWER(bearings.bearing_no) #{ direction }")
    when /^radial_clearance_um_/
    order("LOWER(bearings.radial_clearance_um) #{ direction }")
    when /^sealing_/
    order("LOWER(bearings.sealing) #{ direction }")
    when /^max_speed_rpm_/
    order("LOWER(bearings.max_speed_rpm) #{ direction }")
    when /^position_within_product_/
    order("LOWER(bearings.position_within_product) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(bearings.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(bearings.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(bearings.where_used_plant) #{ direction }")
    when /^supplier_/
    order("LOWER(bearings.supplier) #{ direction }")
    when /^remark_/
    order("LOWER(bearings.remark) #{ direction }")
    when /^reason_/
    order("LOWER(bearings.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_i_dia, lambda { |i_dias| where(i_dia: [*i_dias])}
scope :with_o_dia, lambda { |o_dias| where(o_dia: [*o_dias])}
scope :with_width, lambda { |widths| where(width: [*widths])}
scope :with_bearing_type, lambda { |bearing_types| where(bearing_type: [*bearing_types])}
scope :with_bearing_no, lambda { |bearing_nos| where(bearing_no: [*bearing_nos])}
scope :with_radial_clearance_um, lambda { |radial_clearance_ums| where(radial_clearance_um: [*radial_clearance_ums])}
scope :with_sealing, lambda { |sealings| where(sealing: [*sealings])}
scope :with_max_speed_rpm, lambda { |max_speed_rpms| where(max_speed_rpm: [*max_speed_rpms])}
scope :with_position_within_product, lambda { |position_within_products| where(position_within_product: [*position_within_products])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
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
  where("LOWER(bearings.partnumber) LIKE ? OR LOWER(bearings.description) LIKE ? OR LOWER(bearings.i_dia) LIKE ?
         OR LOWER(bearings.o_dia) LIKE ? OR LOWER(bearings.width) LIKE ? OR LOWER(bearings.bearing_type) LIKE ?
          OR LOWER(bearings.bearing_no) LIKE ? OR LOWER(bearings.radial_clearance_um) LIKE ? OR LOWER(bearings.sealing) LIKE ?
           OR LOWER(bearings.max_speed_rpm) LIKE ? OR LOWER(bearings.position_within_product) LIKE ?
            OR LOWER(bearings.drawing_norm) LIKE ? OR LOWER(bearings.where_used_product) LIKE ? OR LOWER(bearings.where_used_plant) LIKE ?
             OR LOWER(bearings.supplier) LIKE ? OR LOWER(bearings.remark) LIKE ? OR LOWER(bearings.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms, terms, terms, terms)
}

end


