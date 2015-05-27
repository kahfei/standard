class Washer < ActiveRecord::Base

  include ValidateMethods
  include CommonConstants

  	after_initialize :init

  

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ?
        or washer_type LIKE ? or inner_diameter LIKE ? or outer_diameter LIKE ? 
        or thickness LIKE ?  or hardness LIKE ? or coating LIKE ? or material LIKE ? or drawing_number LIKE ? 
        or original_plant LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ? 
        or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%" )
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |washer|
  	  	csv << washer.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","washer_type","inner_diameter","outer_diameter",
    	"thickness", "hardness","coating", "material", "drawing_number",
    	"original_plant","where_used_product","where_used_plant","remark", "reason"]
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
      :with_washer_type,
      :with_inner_diameter,
      :with_outer_diameter,
      :with_thickness,
      :with_hardness,
      :with_coating,
      :with_material,
      :with_drawing_number,
      :with_original_plant,
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

  def self.washer_types_for_select
    order('LOWER(washer_type)').map { |e| [e.washer_type, e.washer_type] }.uniq
  end

  def self.inner_diameters_for_select
    order('LOWER(inner_diameter)').map { |e| [e.inner_diameter, e.inner_diameter] }.uniq
  end

  def self.outer_diameters_for_select
    order('LOWER(outer_diameter)').map { |e| [e.outer_diameter, e.outer_diameter] }.uniq
  end

  def self.thicknesss_for_select
    order('LOWER(thickness)').map { |e| [e.thickness, e.thickness] }.uniq
  end

  def self.hardnesss_for_select
    order('LOWER(hardness)').map { |e| [e.hardness, e.hardness] }.uniq
  end

  def self.coatings_for_select
    order('LOWER(coating)').map { |e| [e.coating, e.coating] }.uniq
  end

  def self.materials_for_select
    order('LOWER(material)').map { |e| [e.material, e.material] }.uniq
  end

  def self.drawing_numbers_for_select
    order('LOWER(drawing_number)').map { |e| [e.drawing_number, e.drawing_number] }.uniq
  end

  def self.original_plants_for_select
    order('LOWER(original_plant)').map { |e| [e.original_plant, e.original_plant] }.uniq
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
    order("washers.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(washers.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(washers.description) #{ direction }")
    when /^washer_type_/
    order("LOWER(washers.washer_type) #{ direction }")
    when /^inner_diameter_/
    order("LOWER(washers.inner_diameter) #{ direction }")
    when /^outer_diameter_/
    order("LOWER(washers.outer_diameter) #{ direction }")
    when /^hardness_/
    order("LOWER(washers.hardness) #{ direction }")
    when /^thickness_/
    order("LOWER(washers.thickness) #{ direction }")
    when /^coating_/
    order("LOWER(washers.coating) #{ direction }")
    when /^material_/
    order("LOWER(washers.material) #{ direction }")
    when /^drawing_number_/
    order("LOWER(washers.drawing_number) #{ direction }")
    when /^original_plant_/
    order("LOWER(washers.original_plant_) #{ direction }")
    when /^where_used_product_/
    order("LOWER(washers.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(washers.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(washers.remark) #{ direction }")
    when /^reason_/
    order("LOWER(washers.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_washer_type, lambda { |washer_types| where(washer_type: [*washer_types])}
scope :with_inner_diameter, lambda { |inner_diameters| where(inner_diameter: [*inner_diameters])}
scope :with_outer_diameter, lambda { |outer_diameters| where(outer_diameter: [*outer_diameters])}
scope :with_hardness, lambda { |hardnesss| where(hardness: [*hardnesss])}
scope :with_thickness, lambda { |thicknesss| where(thickness: [*thicknesss])}
scope :with_coating, lambda { |coatings| where(coating: [*coatings])}
scope :with_material, lambda { |materials| where(material: [*materials])}
scope :with_drawing_number, lambda { |drawing_numbers| where(drawing_number: [*drawing_numbers])}
scope :with_original_plant, lambda { |original_plants| where(original_plant: [*original_plants])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :with_remark, lambda { |remarks| where(remark: [*remarks])}
scope :with_reason, lambda { |remarks| where(reason: [*reasons])}

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
  where("LOWER(washers.partnumber) LIKE ? OR LOWER(washers.description) LIKE ? OR LOWER(washers.washer_type) LIKE ?
          OR LOWER(washers.inner_diameter) LIKE ? OR LOWER(washers.outer_diameter) LIKE ? OR LOWER(washers.hardness) LIKE ?
           OR LOWER(washers.thickness) LIKE ? OR LOWER(washers.coating) LIKE ? OR LOWER(washers.material) LIKE ?
           OR LOWER(washers.drawing_number) LIKE ? OR LOWER(washers.where_used_product) LIKE ?  OR LOWER(washers.original_plant) LIKE ?
           OR LOWER(washers.where_used_plant) LIKE ? OR LOWER(washers.remark) LIKE ? OR LOWER(washers.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, terms, terms,  
             terms, terms, terms, terms, terms)
}

end