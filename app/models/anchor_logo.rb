class AnchorLogo < ActiveRecord::Base

	include ValidateMethods
  include CommonConstants
  after_initialize :init

  self.per_page = 15

  def self.search(query)
  	where('
  		release_status LIKE ? 
  		or housing_partnumber LIKE ? 
  		or housing_supplier LIKE ? 
     	or anchor_logo_diameter LIKE ? 
     	or partnumber LIKE ? 
     	or anchor_logo_supplier LIKE ? 
     	or bosch_logo_partnumber LIKE ? 
     	or bosch_logo_supplier LIKE ? 
     	or where_used_product LIKE ? 
     	or where_used_plant LIKE ? 
     	or remark LIKE ? 
     	or reason LIKE ?',
      "%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", 
  		"%#{query}%" ,"%#{query}%", "%#{query}%", "%#{query}%", 
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |achor_logo|
  	  	csv << achor_logo.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","housing_partnumber","housing_supplier","anchor_logo_diameter","partnumber",
    	"anchor_logo_supplier","bosch_logo_partnumber","bosch_logo_supplier",
    	"where_used_product","where_used_plant","remark","reason"]
  end

  def init 
    self.release_status ||= "released"
  end

  filterrific(
    # default_settings: { sorted_by: 'created_at_desc' },
    # filter_names: [
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_query,
      :sorted_by,
      :with_housing_partnumber,
      :with_housing_supplier,
      :with_anchor_logo_diameter,
      :with_partnumber,
      :with_anchor_logo_supplier,
      :with_bosch_logo_partnumber,
      :with_bosch_logo_supplier,
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

  def self.housing_partnumbers_for_select
    order('LOWER(housing_partnumber)').map { |e| [e.housing_partnumber, e.housing_partnumber] }.uniq
  end

  def self.housing_suppliers_for_select
    order('LOWER(housing_supplier)').map { |e| [e.housing_supplier, e.housing_supplier] }.uniq
  end

  def self.anchor_logo_diameters_for_select
    order('LOWER(anchor_logo_diameter)').map { |e| [e.anchor_logo_diameter, e.anchor_logo_diameter] }.uniq
  end

  def self.partnumbers_for_select
    order('LOWER(partnumber)').map { |e| [e.partnumber, e.partnumber] }.uniq
  end

  def self.anchor_logo_suppliers_for_select
    order('LOWER(anchor_logo_supplier)').map { |e| [e.anchor_logo_supplier, e.anchor_logo_supplier] }.uniq
  end

  def self.bosch_logo_partnumbers_for_select
    order('LOWER(bosch_logo_partnumber)').map { |e| [e.bosch_logo_partnumber, e.bosch_logo_partnumber] }.uniq
  end

  def self.bosch_logo_suppliers_for_select
    order('LOWER(bosch_logo_supplier)').map { |e| [e.bosch_logo_supplier, e.bosch_logo_supplier] }.uniq
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
    order("anchor_logos.created_at #{ direction }")
    when /^housing_partnumber_/
    order("LOWER(anchor_logos.housing_partnumber) #{ direction }")
    when /^housing_supplier_/
    order("LOWER(anchor_logos.housing_supplier) #{ direction }")
    when /^anchor_logo_diameter_/
    order("LOWER(anchor_logos.anchor_logo_diameter) #{ direction }")
    when /^partnumber_/
    order("LOWER(anchor_logos.partnumber) #{ direction }")
    when /^anchor_logo_supplier_/
    order("LOWER(anchor_logos.anchor_logo_supplier) #{ direction }")
  	when /^bosch_logo_partnumber_/
    order("LOWER(anchor_logos.bosch_logo_partnumber) #{ direction }")
    when /^boschlogo_supplier_/
    order("LOWER(anchor_logos.bosch_logo_supplier) #{ direction }")
    when /^where_used_product_/
    order("LOWER(anchor_logos.where_used_product) #{ direction }")
  	when /^where_used_plant_/
    order("LOWER(anchor_logos.where_used_plant) #{ direction }")
   	when /^remark_/
    order("LOWER(anchor_logos.remark) #{ direction }")
  	when /^reason_/
    order("LOWER(anchor_logos.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_housing_partnumber, lambda { |housing_partnumbers| where(housing_partnumber: [*housing_partnumbers])}
scope :with_housing_supplier, lambda { |housing_suppliers| where(housing_supplier: [*housing_suppliers])}
scope :with_anchor_logo_diameter, lambda { |anchor_logo_diameters| where(anchor_logo_diameter: [*anchor_logo_diameters])}
scope :with_anchor_logo_supplier, lambda { |anchor_logo_suppliers| where(anchor_logo_supplier: [*anchor_logo_suppliers])}
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_bosch_logo_partnumber, lambda { |corresponding_carbon_brushs| where(corresponding_carbon_brush: [*corresponding_carbon_brushs])}
scope :with_bosch_logo_supplier, lambda { |bosch_logo_suppliers| where(bosch_logo_supplier: [*bosch_logo_suppliers])}
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
  # num_or_conds = 7
  where("LOWER(anchor_logos.housing_partnumber) LIKE ? 
  			OR LOWER(anchor_logos.housing_supplier) LIKE ? 
  			OR LOWER(anchor_logos.anchor_logo_diameter) LIKE ?
         	OR LOWER(anchor_logos.anchor_logo_supplier) LIKE ? 
         	OR LOWER(anchor_logos.partnumber) LIKE ? 
         	OR LOWER(anchor_logos.bosch_logo_partnumber) LIKE ?
          	OR LOWER(anchor_logos.bosch_logo_supplier) LIKE ? 
          	OR LOWER(anchor_logos.where_used_product) LIKE ? 
          	OR LOWER(anchor_logos.where_used_plant) LIKE ?
			OR LOWER(anchor_logos.remark) LIKE ? ,
          	OR LOWER(anchor_logos.reason) LIKE ? ",
          	terms, terms, terms, terms, terms, terms, terms, terms, terms, terms, terms)
}


end
