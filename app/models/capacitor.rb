class Capacitor < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or capacitor_type LIKE ? or capacity LIKE ? or feet LIKE ? 
        or capacitor_class LIKE ? or drawing_norm LIKE ?
         or where_used_product LIKE ? or where_used_plant LIKE ? 
         or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |capacitor|
  	  	csv << capacitor.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","capacitor_type","capacity",
    	"feet", "capacitor_class","drawing_norm",
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
      :with_capacitor_type,
      :with_capacity,
      :with_feet,
      :with_capacitor_class,
      :with_drawing_norm,
      :with_where_used_product,
      :with_where_used_plant,
      :with_remark,
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

  def self.capacitor_types_for_select
    order('LOWER(capacitor_type)').map { |e| [e.capacitor_type, e.capacitor_type] }.uniq
  end

  def self.capacitys_for_select
    order('LOWER(capacity)').map { |e| [e.capacity, e.capacity] }.uniq
  end

  def self.feets_for_select
    order('LOWER(feet)').map { |e| [e.feet, e.feet] }.uniq
  end

  def self.capacitor_classs_for_select
    order('LOWER(capacitor_class)').map { |e| [e.capacitor_class, e.capacitor_class] }.uniq
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
    order("capacitors.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(capacitors.partnumber) #{ direction }")
    when /^descriptions_/
    order("LOWER(capacitors.description) #{ direction }")
    when /^capacitor_types_/
    order("LOWER(capacitors.capacitor_type) #{ direction }")
    when /^capacity_/
    order("LOWER(capacitors.capacity) #{ direction }")
    when /^feet_/
    order("LOWER(capacitors.feet) #{ direction }")
    when /^capacitor_class_/
    order("LOWER(capacitors.capacitor_class) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(capacitors.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(capacitors.where_used_product) #{ direction }")
    when /^where_used_plants_/
    order("LOWER(capacitors.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(capacitors.remark) #{ direction }")
    when /^reason_/
    order("LOWER(capacitors.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_capacitor_type, lambda { |capacitor_types| where(capacitor_type: [*capacitor_types])}
scope :with_capacity, lambda { |capacitys| where(capacity: [*capacitys])}
scope :with_feet, lambda { |feets| where(feet: [*feets])}
scope :with_capacitor_class, lambda { |capacitor_classs| where(capacitor_class: [*capacitor_classs])}
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
  where("LOWER(capacitors.partnumber) LIKE ? OR LOWER(capacitors.description) LIKE ? OR LOWER(capacitors.capacitor_type) LIKE ?
          OR LOWER(capacitors.capacity) LIKE ? OR LOWER(capacitors.feet) LIKE ? OR LOWER(capacitors.capacitor_class) LIKE ?
           OR LOWER(capacitors.drawing_norm) LIKE ? OR LOWER(capacitors.where_used_product) LIKE ? OR LOWER(capacitors.where_used_plant) LIKE ?
            OR LOWER(capacitors.remark) LIKE ? OR LOWER(capacitors.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms)
}

end