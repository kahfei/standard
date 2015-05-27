class Grommet < ActiveRecord::Base
   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? 
        or description LIKE ? or inner_hole_diameter LIKE ? 
        or grommet_type LIKE ? or length LIKE ? or for_cord_od LIKE ? 
        or material LIKE ? or drawing_norm LIKE ? or where_used_product LIKE ? 
        or where_used_plant LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |grommet|
  	  	csv << grommet.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","inner_hole_diameter","grommet_type","length",
    	"for_cord_od","material","drawing_norm",
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
      :with_inner_hole_diameter,
      :with_grommet_type,
      :with_length,
      :with_for_cord_od,
      :with_material,
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

  def self.inner_hole_diameters_for_select
    order('LOWER(inner_hole_diameter)').map { |e| [e.inner_hole_diameter, e.inner_hole_diameter] }.uniq
  end

  def self.grommet_types_for_select
    order('LOWER(grommet_type)').map { |e| [e.grommet_type, e.grommet_type] }.uniq
  end

  def self.lengths_for_select
    order('LOWER(length)').map { |e| [e.length, e.length] }.uniq
  end

  def self.for_cord_ods_for_select
    order('LOWER(for_cord_od)').map { |e| [e.for_cord_od, e.for_cord_od] }.uniq
  end

  def self.materials_for_select
    order('LOWER(material)').map { |e| [e.material, e.material] }.uniq
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
    order("grommets.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(grommets.partnumber) #{ direction }")
    when /^descriptions_/
    order("LOWER(grommets.description) #{ direction }")
    when /^inner_hole_diameter_/
    order("LOWER(grommets.inner_hole_diameter) #{ direction }")
    when /^grommet_type_/
    order("LOWER(grommets.grommet_type) #{ direction }")
    when /^length_/
    order("LOWER(grommets.length) #{ direction }")
    when /^for_cord_od_/
    order("LOWER(grommets.for_cord_od) #{ direction }")
    when /^material_/
    order("LOWER(grommets.material) #{ direction }")
    when /^drawing_norms_/
    order("LOWER(grommets.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(grommets.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(grommets.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(grommets.remark) #{ direction }")
    when /^reason_/
    order("LOWER(grommets.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_inner_hole_diameter, lambda { |inner_hole_diameters| where(inner_hole_diameter: [*inner_hole_diameters])}
scope :with_grommet_type, lambda { |grommet_types| where(grommet_type: [*grommet_types])}
scope :with_length, lambda { |lengths| where(length: [*lengths])}
scope :with_for_cord_od, lambda { |for_cord_ods| where(for_cord_od: [*for_cord_ods])}
scope :with_material, lambda { |materials| where(material: [*materials])}
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
  where("LOWER(grommets.partnumber) LIKE ? OR LOWER(grommets.description) LIKE ?
       OR LOWER(grommets.inner_hole_diameter) LIKE ?
         OR LOWER(grommets.grommet_type) LIKE ? OR LOWER(grommets.length) LIKE ? 
         OR LOWER(grommets.for_cord_od) LIKE ?
          OR LOWER(grommets.material) LIKE ?
           OR LOWER(grommets.drawing_norm) LIKE ? OR LOWER(grommets.where_used_product) LIKE ? 
           OR LOWER(grommets.where_used_plant) LIKE ?
            OR LOWER(grommets.remark) LIKE ?  OR LOWER(grommets.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms)
}

end
