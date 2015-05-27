class Nut < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or nut_type LIKE ? or nut_size LIKE ? or material LIKE ? or width LIKE ? or drawing_number LIKE ? 
        or coating LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ? 
        or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |nut|
  	  	csv << nut.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","nut_type","nut_size","material","width",
    	"drawing_number","coating",
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
      :with_nut_type,
      :with_nut_size,
      :with_material,
      :with_width,
      :with_coating,
      :with_drawing_number,
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

  def self.nut_types_for_select
    order('LOWER(nut_type)').map { |e| [e.nut_type, e.nut_type] }.uniq
  end

  def self.nut_sizes_for_select
    order('LOWER(nut_size)').map { |e| [e.nut_size, e.nut_size] }.uniq
  end

  def self.materials_for_select
    order('LOWER(material)').map { |e| [e.material, e.material] }.uniq
  end

  def self.widths_for_select
    order('LOWER(width)').map { |e| [e.width, e.width] }.uniq
  end

  def self.coatings_for_select
    order('LOWER(coating)').map { |e| [e.coating, e.coating] }.uniq
  end

  def self.drawing_numbers_for_select
    order('LOWER(drawing_number)').map { |e| [e.drawing_number, e.drawing_number] }.uniq
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
    order("nuts.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(nuts.partnumber) #{ direction }")
    when /^descriptions_/
    order("LOWER(nuts.description) #{ direction }")
    when /^nut_types_/
    order("LOWER(nuts.nut_type) #{ direction }")
    when /^nut_size_/
    order("LOWER(nuts.nut_size) #{ direction }")
    when /^material_/
    order("LOWER(nuts.material_) #{ direction }")
    when /^width_/
    order("LOWER(nuts.width) #{ direction }")
    when /^coating_/
    order("LOWER(nuts.coating) #{ direction }")
    when /^drawing_numbers_/
    order("LOWER(nuts.drawing_number) #{ direction }")
    when /^where_used_product_/
    order("LOWER(nuts.where_used_product) #{ direction }")
    when /^where_used_plants_/
    order("LOWER(nuts.where_used_plant) #{ direction }")
    when /^remarks_/
    order("LOWER(nuts.remark) #{ direction }")
    when /^reasons_/
    order("LOWER(nuts.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_nut_type, lambda { |nut_types| where(nut_type: [*nut_types])}
scope :with_nut_size, lambda { |nut_sizes| where(nut_size: [*nut_sizes])}
scope :with_material, lambda { |materials| where(material: [*materials])}
scope :with_width, lambda { |widths| where(width: [*widths])}
scope :with_coating, lambda { |coatings| where(coating: [*coatings])}
scope :with_drawing_number, lambda { |drawing_numbers| where(drawing_number: [*drawing_numbers])}
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
  where("LOWER(nuts.partnumber) LIKE ? OR LOWER(nuts.description) LIKE ? OR LOWER(nuts.nut_type) LIKE ?
          OR LOWER(nuts.nut_size) LIKE ? OR LOWER(nuts.material) LIKE ? OR LOWER(nuts.width) LIKE ? 
          OR LOWER(nuts.coating) LIKE ?
           OR LOWER(nuts.drawing_number) LIKE ? OR LOWER(nuts.where_used_product) LIKE ?
            OR LOWER(nuts.where_used_plant) LIKE ?
            OR LOWER(nuts.remark) LIKE ? OR LOWER(nuts.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms)
}

end