class CarbonBrush < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	CUT_OFF = [nil, "No", "Yes"]
  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or components LIKE ? or cross_sec LIKE ? or length LIKE ? or wire_length_or_spring_free_length LIKE ? 
        or radius_for_commutator_mm LIKE ? or cut_off LIKE ? or supplier LIKE ? or drawing_norm LIKE ? 
        or where_used_product LIKE ? or where_used_plant LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |carbon_brush|
  	  	csv << carbon_brush.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","components","cross_sec","length","wire_length_or_spring_free_length","radius_for_commutator_mm",
    	"cut_off", "supplier", "max_speed_rpm", "drawing_norm",
    	"where_used_product","where_used_plant","remark", "reason"]
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
      :with_components,
      :with_cross_sec,
      :with_length,
      :with_wire_length_or_spring_free_length,
      :with_radius_for_commutator_mm,
      :with_cut_off,
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

  def self.componentss_for_select
    order('LOWER(components)').map { |e| [e.components, e.components] }.uniq
  end

  def self.cross_secs_for_select
    order('LOWER(cross_sec)').map { |e| [e.cross_sec, e.cross_sec] }.uniq
  end

  def self.lengths_for_select
    order('LOWER(length)').map { |e| [e.length, e.length] }.uniq
  end

  def self.wire_length_or_spring_free_lengths_for_select
    order('LOWER(wire_length_or_spring_free_length)').map { |e| [e.wire_length_or_spring_free_length, e.wire_length_or_spring_free_length] }.uniq
  end

  def self.radius_for_commutator_mms_for_select
    order('LOWER(radius_for_commutator_mm)').map { |e| [e.radius_for_commutator_mm, e.radius_for_commutator_mm] }.uniq
  end

  def self.cut_offs_for_select
    order('LOWER(cut_off)').map { |e| [e.cut_off, e.cut_off] }.uniq
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
    order("carbon_brushes.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(carbon_brushes.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(carbon_brushes.description) #{ direction }")
    when /^components_/
    order("LOWER(carbon_brushes.components) #{ direction }")
    when /^cross_sec_/
    order("LOWER(carbon_brushes.cross_sec) #{ direction }")
    when /^length_/
    order("LOWER(carbon_brushes.length) #{ direction }")
    when /^wire_length_or_spring_free_length_/
    order("LOWER(carbon_brushes.wire_length_or_spring_free_length) #{ direction }")
    when /^radius_for_commutator_mm_/
    order("LOWER(carbon_brushes.radius_for_commutator_mm) #{ direction }")
    when /^cut_off_/
    order("LOWER(carbon_brushes.cut_off) #{ direction }")
    when /^supplier_/
    order("LOWER(carbon_brushes.supplier) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(carbon_brushes.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(carbon_brushes.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(carbon_brushes.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(carbon_brushes.remark) #{ direction }")
    when /^reason_/
    order("LOWER(carbon_brushes.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_components, lambda { |componentss| where(components: [*componentss])}
scope :with_cross_sec, lambda { |cross_secs| where(cross_sec: [*cross_secs])}
scope :with_length, lambda { |lengths| where(length: [*lengths])}
scope :with_wire_length_or_spring_free_length, lambda { |wire_length_or_spring_free_lengths| where(wire_length_or_spring_free_length: [*wire_length_or_spring_free_lengths])}
scope :with_radius_for_commutator_mm, lambda { |radius_for_commutator_mms| where(radius_for_commutator_mm: [*radius_for_commutator_mms])}
scope :with_cut_off, lambda { |cut_offs| where(cut_off: [*cut_offs])}
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
  where("LOWER(carbon_brushes.partnumber) LIKE ? OR LOWER(carbon_brushes.description) LIKE ? OR LOWER(carbon_brushes.components) LIKE ?
         OR LOWER(carbon_brushes.cross_sec) LIKE ? OR LOWER(carbon_brushes.length) LIKE ? OR LOWER(carbon_brushes.wire_length_or_spring_free_length) LIKE ?
          OR LOWER(carbon_brushes.radius_for_commutator_mm) LIKE ? OR LOWER(carbon_brushes.cut_off) LIKE ? OR LOWER(carbon_brushes.supplier) LIKE ?
           OR LOWER(carbon_brushes.drawing_norm) LIKE ? OR LOWER(carbon_brushes.where_used_product) LIKE ? OR LOWER(carbon_brushes.where_used_plant) LIKE ?
            OR LOWER(carbon_brushes.remark) LIKE ? OR LOWER(carbon_brushes.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms)
}

end
