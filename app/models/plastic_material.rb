class PlasticMaterial < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or resin LIKE ? 
        or color LIKE ? or supplier LIKE ? or recommendation LIKE ? 
        or drawing_norm LIKE ? or ul_number LIKE ? or where_used_product LIKE ? or where_used_plant LIKE ?
        or supplier_material_info LIKE ? or related_molders LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
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
    ["id","partnumber","resin","color","supplier","recommendation",
    	"drawing_norm","ul_number",
    	"where_used_product","where_used_plant","supplier_material_info","related_molders", "reason"]
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
      :with_resin,
      :with_color,
      :with_supplier,
      :with_recommendation,
      :with_ul_number,
      :with_drawing_norm,
      :with_where_used_product,
      :with_where_used_plant,
      :with_supplier_material_info,
      :with_related_molders,
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

  def self.resins_for_select
    order('LOWER(resin)').map { |e| [e.resin, e.resin] }.uniq
  end

  def self.colors_for_select
    order('LOWER(color)').map { |e| [e.color, e.color] }.uniq
  end

  def self.suppliers_for_select
    order('LOWER(supplier)').map { |e| [e.supplier, e.supplier] }.uniq
  end

  def self.recommendations_for_select
    order('LOWER(recommendation)').map { |e| [e.recommendation, e.recommendation] }.uniq
  end

  def self.ul_numbers_for_select
    order('LOWER(ul_number)').map { |e| [e.ul_number, e.ul_number] }.uniq
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

  def self.supplier_material_infos_for_select
    order('LOWER(supplier_material_info)').map { |e| [e.supplier_material_info, e.supplier_material_info] }.uniq
  end

  def self.related_molderss_for_select
    order('LOWER(related_molders)').map { |e| [e.related_molders, e.related_molders] }.uniq
  end

  def self.reason_for_select
    order('LOWER(reason)').map { |e| [e.reason, e.reason] }.uniq
  end

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
    order("plastic_materials.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(plastic_materials.partnumber) #{ direction }")
    when /^resin_/
    order("LOWER(plastic_materials.resin) #{ direction }")
    when /^color_/
    order("LOWER(plastic_materials.color) #{ direction }")
    when /^supplier_/
    order("LOWER(plastic_materials.supplier) #{ direction }")
    when /^recommendation_/
    order("LOWER(plastic_materials.recommendation) #{ direction }")
    when /^ul_number_/
    order("LOWER(plastic_materials.ul_number) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(plastic_materials.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(plastic_materials.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(plastic_materials.where_used_plant) #{ direction }")
    when /^supplier_material_info_/
    order("LOWER(plastic_materials.supplier_material_info) #{ direction }")
    when /^related_molders_/
    order("LOWER(plastic_materials.related_molders) #{ direction }")
    when /^reason_/
    order("LOWER(plastic_materials.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_resin, lambda { |resins| where(resin: [*resins])}
scope :with_color, lambda { |colors| where(color: [*colors])}
scope :with_supplier, lambda { |suppliers| where(supplier: [*suppliers])}
scope :with_recommendation, lambda { |recommendations| where(recommendation: [*recommendations])}
scope :with_ul_number, lambda { |ul_numbers| where(ul_number: [*ul_numbers])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :with_supplier_material_info, lambda { |supplier_material_infos| where(supplier_material_info: [*supplier_material_infos])}
scope :with_related_molders, lambda { |related_molderss| where(related_molders: [*related_molderss])}
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
  where("LOWER(plastic_materials.partnumber) LIKE ? OR LOWER(plastic_materials.resin) LIKE ? OR LOWER(plastic_materials.color) LIKE ?
          OR LOWER(plastic_materials.supplier) LIKE ? OR LOWER(plastic_materials.recommendation) LIKE ? OR LOWER(plastic_materials.ul_number) LIKE ?
           OR LOWER(plastic_materials.drawing_norm) LIKE ? OR LOWER(plastic_materials.where_used_product) LIKE ? 
           OR LOWER(plastic_materials.supplier_material_info) LIKE ? OR LOWER(plastic_materials.where_used_plant) LIKE ? 
            OR LOWER(plastic_materials.related_molders) LIKE ? OR LOWER(plastic_materials.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms)
}

end
