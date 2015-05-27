class Grease < ActiveRecord::Base
   include ValidateMethods
   include CommonConstants
  
  after_initialize :init

  

  self.per_page = 15

	def self.search(query)
    #if search
	 		#where('partnumber LIKE ?', "%#{search}%") 
	  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
          or grease_type LIKE ? or lubricated_location LIKE ? or drawing_norm LIKE ? 
          or supplier LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ?
          or reason LIKE ?', 
	  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", 
        "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
		#else
	  	 	#scoped
		#end
  end

  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |grease|
  	  	csv << grease.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","grease_type","partnumber","description","lubricated_location",
    	"drawing_norm","supplier","where_used_product","where_used_plant","reason"]
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
      :with_grease_type,
      :with_lubricated_location,
      :with_drawing_norm,
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

  def self.grease_types_for_select
    order('LOWER(grease_type)').map { |e| [e.grease_type, e.grease_type] }.uniq
  end

  def self.lubricated_locations_for_select
    order('LOWER(lubricated_location)').map { |e| [e.lubricated_location, e.lubricated_location] }.uniq
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
    order("greases.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(greases.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(greases.description) #{ direction }")
    when /^grease_type_/
    order("LOWER(greases.grease_type) #{ direction }")
    when /^lubricated_location_/
    order("LOWER(greases.lubricated_location) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(greases.drawing_norm) #{ direction }")
    when /^supplier_/
    order("LOWER(greases.supplier) #{ direction }")
    when /^where_used_product_/
    order("LOWER(greases.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(greases.where_used_plant) #{ direction }")
    when /^reason_/
    order("LOWER(greases.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_grease_type, lambda { |grease_types| where(grease_type: [*grease_types])}
scope :with_lubricated_location, lambda { |lubricated_locations| where(lubricated_location: [*lubricated_locations])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
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
  where("LOWER(greases.partnumber) LIKE ? OR LOWER(greases.description) LIKE ? OR LOWER(greases.grease_type) LIKE ?
         OR LOWER(greases.lubricated_location) LIKE ? OR LOWER(greases.drawing_norm) LIKE ?
          OR LOWER(greases.supplier) LIKE ? OR LOWER(greases.where_used_product) LIKE ? 
          OR LOWER(greases.where_used_plant) LIKE ? OR LOWER(greases.reason) LIKE ?",
          terms, terms, terms, terms, terms, terms, terms, terms, terms)
}
end
