class Copperwire < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	SELF_BONDED = [nil, "No", "Yes"]
  	

    self.per_page = 15

  	def self.search(query)
  		where(
        'release_status LIKE ? or 
        partnumber LIKE ? or 
        description LIKE ? or 
        copperwire_type LIKE ? or 
        self_bonded LIKE ? or 
        diameter LIKE ? or 
        drawing_norm LIKE ? or 
        supplier LIKE ? or 
        where_used_product LIKE ? or 
        where_used_plant LIKE ? or 
        reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", 
      "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |copperwire|
  	  	csv << copperwire.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","copperwire_type","self_bonded",
    	"diameter","drawing_norm","supplier","where_used_product","where_used_plant","reason"]
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
      :with_copperwire_type,
      :with_self_bonded,
      :with_diameter,
      :with_drawing_norm,
      :with_supplier,
      :with_where_used_product,
      :with_where_used_plant,
      :with_reason
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

  def self.copperwire_types_for_select
    order('LOWER(copperwire_type)').map { |e| [e.copperwire_type, e.copperwire_type] }.uniq
  end

  def self.self_bondeds_for_select
    order('LOWER(self_bonded)').map { |e| [e.self_bonded, e.self_bonded] }.uniq
  end

  def self.diameters_for_select
    order('LOWER(diameter)').map { |e| [e.diameter, e.diameter] }.uniq
  end

  def self.drawing_norms_for_select
    order('LOWER(drawing_norm)').map { |e| [e.drawing_norm, e.drawing_norm] }.uniq
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
    order("copperwires.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(copperwires.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(copperwires.description) #{ direction }")
    when /^copperwire_type_/
    order("LOWER(copperwires.copperwire_type) #{ direction }")
    when /^self_bonded_/
    order("LOWER(copperwires.self_bonded) #{ direction }")
    when /^diameter_/
    order("LOWER(copperwires.diameter) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(copperwires.drawing_norm) #{ direction }")
    when /^supplier_/
    order("LOWER(copperwires.supplier) #{ direction }")
    when /^where_used_product_/
    order("LOWER(copperwires.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(copperwires.where_used_plant) #{ direction }")
    when /^reason_/
    order("LOWER(copperwires.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_copperwire_type, lambda { |copperwire_types| where(copperwire_type: [*copperwire_types])}
scope :with_self_bonded, lambda { |self_bondeds| where(self_bonded: [*self_bondeds])}
scope :with_diameter, lambda { |diameters| where(diameter: [*diameters])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_reason, lambda { |reasons| where(reason: [*reasons])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}

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
  where("LOWER(copperwires.partnumber) LIKE ? OR 
          LOWER(copperwires.description) LIKE ? OR 
          LOWER(copperwires.copperwire_type) LIKE ? OR 
          LOWER(copperwires.self_bonded) LIKE ? OR 
          LOWER(copperwires.diameter) LIKE ? OR 
          LOWER(copperwires.drawing_norm) LIKE ? OR 
          LOWER(copperwires.supplier) LIKE ? OR 
          LOWER(copperwires.where_used_product) LIKE ? OR 
          LOWER(copperwires.where_used_plant) LIKE ? OR 
          LOWER(copperwires.reason) LIKE ?",
          terms, terms, terms, terms, terms, 
          terms, terms, terms, terms, terms)
}
end