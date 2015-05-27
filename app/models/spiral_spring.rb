class SpiralSpring < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ?
        or material_thickness LIKE ? or material_width LIKE ? or outer_dia LIKE ? 
        or torsion_arm_length LIKE ? or torsion_arm_movable_distance LIKE ? 
        or initial_force LIKE ? or supplier LIKE ? or drawing_norm LIKE ? 
        or where_used_product LIKE ? or where_used_plant LIKE ? or final_force LIKE ?
        or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |spiral_spring|
  	  	csv << spiral_spring.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","material_thickness","material_width","outer_dia",
    	"torsion_arm_length","torsion_arm_movable_distance",
    	"initial_force", "supplier", "drawing_norm",
    	"where_used_product","where_used_plant","final_force", "reason"]
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
      :with_material_thickness,
      :with_material_width,
      :with_outer_dia,
      :with_torsion_arm_length,
      :with_torsion_arm_movable_distance,
      :with_initial_force,
      :with_final_force,
      :with_supplier,
      :with_drawing_norm,
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

  def self.material_thicknesss_for_select
    order('LOWER(material_thickness)').map { |e| [e.material_thickness, e.material_thickness] }.uniq
  end

  def self.material_widths_for_select
    order('LOWER(material_width)').map { |e| [e.material_width, e.material_width] }.uniq
  end

  def self.outer_dias_for_select
    order('LOWER(outer_dia)').map { |e| [e.outer_dia, e.outer_dia] }.uniq
  end

  def self.torsion_arm_lengths_for_select
    order('LOWER(torsion_arm_length)').map { |e| [e.torsion_arm_length, e.torsion_arm_length] }.uniq
  end

  def self.torsion_arm_movable_distances_for_select
    order('LOWER(torsion_arm_movable_distance)').map { |e| [e.torsion_arm_movable_distance, e.torsion_arm_movable_distance] }.uniq
  end

  def self.initial_forces_for_select
    order('LOWER(initial_force)').map { |e| [e.initial_force, e.initial_force] }.uniq
  end

  def self.final_forces_for_select
    order('LOWER(final_force)').map { |e| [e.final_force, e.final_force] }.uniq
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
  def self.reasons_for_select
    order('LOWER(reason)').map { |e| [e.reason, e.reason] }.uniq
  end


  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
    order("spiral_springs.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(spiral_springs.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(spiral_springs.description) #{ direction }")
    when /^material_thickness_/
    order("LOWER(spiral_springs.material_thickness) #{ direction }")
    when /^material_width_/
    order("LOWER(spiral_springs.material_width) #{ direction }")
    when /^outer_dia_/
    order("LOWER(spiral_springs.outer_dia) #{ direction }")
    when /^torsion_arm_length_/
    order("LOWER(spiral_springs.torsion_arm_length) #{ direction }")
    when /^torsion_arm_movable_distance_/
    order("LOWER(spiral_springs.torsion_arm_movable_distance) #{ direction }")
    when /^initial_force_/
    order("LOWER(spiral_springs.initial_force) #{ direction }")
    when /^final_force_/
    order("LOWER(spiral_springs.final_force) #{ direction }")
    when /^supplier_/
    order("LOWER(spiral_springs.supplier) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(spiral_springs.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(spiral_springs.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(spiral_springs.where_used_plant) #{ direction }")
    when /^reason_/
    order("LOWER(spiral_springs.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_material_thickness, lambda { |material_thicknesss| where(material_thickness: [*material_thicknesss])}
scope :with_material_width, lambda { |material_widths| where(material_width: [*material_widths])}
scope :with_outer_dia, lambda { |outer_dias| where(outer_dia: [*outer_dias])}
scope :with_torsion_arm_length, lambda { |torsion_arm_lengths| where(torsion_arm_length: [*torsion_arm_lengths])}
scope :with_torsion_arm_movable_distance, lambda { |torsion_arm_movable_distances| where(torsion_arm_movable_distance: [*torsion_arm_movable_distances])}
scope :with_initial_force, lambda { |initial_forces| where(initial_force: [*initial_forces])}
scope :with_final_force, lambda { |final_forces| where(final_force: [*final_forces])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
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
  # num_or_conds = 16
  where("LOWER(spiral_springs.partnumber) LIKE ? OR LOWER(spiral_springs.description) LIKE ?
         OR LOWER(spiral_springs.material_thickness) LIKE ?
         OR LOWER(spiral_springs.material_width) LIKE ? OR LOWER(spiral_springs.outer_dia) LIKE ?
          OR LOWER(spiral_springs.torsion_arm_length) LIKE ?
          OR LOWER(spiral_springs.torsion_arm_movable_distance) LIKE ? OR LOWER(spiral_springs.initial_force) LIKE ?
           OR LOWER(spiral_springs.final_force) LIKE ? OR LOWER(spiral_springs.supplier) LIKE ?
           OR LOWER(spiral_springs.drawing_norm) LIKE ? OR LOWER(spiral_springs.where_used_product) LIKE ?
            OR LOWER(spiral_springs.where_used_plant) LIKE ? OR LOWER(spiral_springs.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms)
}

end
