class BrushHolder < ActiveRecord::Base
   include ValidateMethods
    include CommonConstants
  	after_initialize :init

  	self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or brush_holder_type LIKE ? or material LIKE ? or drawing_norm LIKE ? 
        or corresponding_carbon_brush LIKE ? or supplier LIKE ? or where_used_product LIKE ? 
        or where_used_plant LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" ,
       "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |brush_holder|
  	  	csv << brush_holder.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","brush_holder_type","material",
    	"drawing_norm","corresponding_carbon_brush","supplier",
    	"where_used_product","where_used_plant","reason"]
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
      :with_brush_holder_type,
      :with_material,
      :with_drawing_norm,
      :with_corresponding_carbon_brush,
      :with_supplier,
      :with_where_used_product,
      :with_where_used_plant,
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

  def self.brush_holder_types_for_select
    order('LOWER(brush_holder_type)').map { |e| [e.brush_holder_type, e.brush_holder_type] }.uniq
  end

  def self.materials_for_select
    order('LOWER(material)').map { |e| [e.material, e.material] }.uniq
  end

  def self.drawing_norms_for_select
    order('LOWER(drawing_norm)').map { |e| [e.drawing_norm, e.drawing_norm] }.uniq
  end

  def self.corresponding_carbon_brushs_for_select
    order('LOWER(corresponding_carbon_brush)').map { |e| [e.corresponding_carbon_brush, e.corresponding_carbon_brush] }.uniq
  end

  def self.suppliers_for_select
    order('LOWER(supplier)').map { |e| [e.supplier, e.supplier] }.uniq
  end

  def self.where_used_products_for_select
    order('LOWER(where_used_product)').map { |e| [e.where_used_product, e.where_used_product] }.uniq
  end

  def self.where_used_plants_for_select
    order('LOWER(where_used_plant)').map { |e| [e.where_used_plant, e.where_used_plant] }.uniq
  end

  def self.reasons_for_select
    order('LOWER(reason)').map { |e| [e.reason, e.reason] }.uniq
  end

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
    order("brush_holders.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(brush_holders.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(brush_holders.description) #{ direction }")
    when /^brush_holder_type_/
    order("LOWER(brush_holders.brush_holder_type) #{ direction }")
    when /^material_/
    order("LOWER(brush_holders.material) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(brush_holders.drawing_norm) #{ direction }")
  when /^corresponding_carbon_brush_/
    order("LOWER(brush_holders.corresponding_carbon_brush) #{ direction }")
    when /^supplier_/
    order("LOWER(brush_holders.supplier) #{ direction }")
    when /^where_used_product_/
    order("LOWER(brush_holders.where_used_product) #{ direction }")
  when /^where_used_plant_/
    order("LOWER(brush_holders.where_used_plant) #{ direction }")
  when /^reason_/
    order("LOWER(brush_holders.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_brush_holder_type, lambda { |brush_holder_types| where(brush_holder_type: [*brush_holder_types])}
scope :with_material, lambda { |materials| where(material: [*materials])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_corresponding_carbon_brush, lambda { |corresponding_carbon_brushs| where(corresponding_carbon_brush: [*corresponding_carbon_brushs])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
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
  # num_or_conds = 7
  where("LOWER(brush_holders.partnumber) LIKE ? OR LOWER(brush_holders.description) LIKE ? OR LOWER(brush_holders.brush_holder_type) LIKE ?
         OR LOWER(brush_holders.material) LIKE ? OR LOWER(brush_holders.drawing_norm) LIKE ? OR LOWER(brush_holders.corresponding_carbon_brush) LIKE ?
          OR LOWER(brush_holders.supplier) LIKE ? OR LOWER(brush_holders.where_used_product) LIKE ? OR LOWER(brush_holders.where_used_plant) LIKE ?
          OR LOWER(brush_holders.reason) LIKE ? ",
          terms, terms, terms, terms, terms, terms, terms, terms, terms, terms)
}
end
