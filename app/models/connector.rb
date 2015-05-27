class Connector < ActiveRecord::Base

  include ValidateMethods
  include CommonConstants


  	after_initialize :init

  	CONNECTOR_TYPE = [nil, "Blade", "Socket", "Other"]
  	

  	self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? or connector_type LIKE ? or drawing_norm LIKE ? or h_x_w LIKE ? or supplier LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
	  	CSV.generate(options) do |csv|
	  	  	csv << column_names
		  	all.each do |connector|
		  		csv << connector.attributes.values_at(*column_names)
		  	end
	  	end
	end

	def self.accessible_attributes
		["id","partnumber","description","connector_type",
	    	"drawing_norm","h_x_w","supplier","where_used_product","where_used_plant"]
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
      :with_connector_type,
      :with_drawing_norm,
      :with_h_x_w,
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

  def self.connector_types_for_select
    order('LOWER(connector_type)').map { |e| [e.connector_type, e.connector_type] }.uniq
  end

  def self.drawing_norms_for_select
    order('LOWER(drawing_norm)').map { |e| [e.drawing_norm, e.drawing_norm] }.uniq
  end

  def self.h_x_ws_for_select
    order('LOWER(h_x_w)').map { |e| [e.h_x_w, e.h_x_w] }.uniq
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
    order("connectors.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(connectors.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(connectors.description) #{ direction }")
    when /^connector_type_/
    order("LOWER(connectors.connector_type) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(connectors.drawing_norm) #{ direction }")
    when /^h_x_w_/
    order("LOWER(connectors.h_x_w) #{ direction }")
    when /^supplier_/
    order("LOWER(connectors.supplier) #{ direction }")
    when /^where_used_product_/
    order("LOWER(connectors.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(connectors.where_used_plant) #{ direction }")
  when /^reason_/
    order("LOWER(connectors.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_connector_type, lambda { |connector_types| where(connector_type: [*connector_types])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_h_x_w, lambda { |h_x_ws| where(h_x_w: [*h_x_ws])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :reason, lambda { |reasons| where(reason: [*reasons])}


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
  where("LOWER(connectors.partnumber) LIKE ? OR LOWER(connectors.description) LIKE ? OR LOWER(connectors.connector_type) LIKE ?
         OR LOWER(connectors.drawing_norm) LIKE ? OR LOWER(connectors.h_x_w) LIKE ?
          OR LOWER(connectors.supplier) LIKE ? OR LOWER(connectors.where_used_product) LIKE ? 
          OR LOWER(connectors.where_used_plant) LIKE ? OR LOWER(connectors.reason) LIKE ?",
          terms, terms, terms, terms, terms, terms, terms, terms, terms )
}
end
