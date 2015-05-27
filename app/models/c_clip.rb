class CClip < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants
  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or clip_type LIKE ? or norminal_diameter LIKE ? or thickness LIKE ? 
        or coating LIKE ? or drawing_norm LIKE ? or where_used_product LIKE ? 
        or where_used_plant LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |c_clip|
  	  	csv << c_clip.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","clip_type","norminal_diameter",
    	"thickness", "coating", "drawing_norm",
    	"where_used_product","where_used_plant","remark"]
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
      :with_clip_type,
      :with_norminal_diameter,
      :with_thickness,
      :with_coating,
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

  def self.clip_types_for_select
    order('LOWER(clip_type)').map { |e| [e.clip_type, e.clip_type] }.uniq
  end

  def self.norminal_diameters_for_select
    order('LOWER(norminal_diameter)').map { |e| [e.norminal_diameter, e.norminal_diameter] }.uniq
  end

  def self.thicknesss_for_select
    order('LOWER(thickness)').map { |e| [e.thickness, e.thickness] }.uniq
  end

  def self.coatings_for_select
    order('LOWER(coating)').map { |e| [e.coating, e.coating] }.uniq
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
    order("c_clips.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(c_clips.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(c_clips.description) #{ direction }")
    when /^clip_type_/
    order("LOWER(c_clips.clip_type) #{ direction }")
    when /^norminal_diameter_/
    order("LOWER(c_clips.norminal_diameter) #{ direction }")
    when /^thickness_/
    order("LOWER(c_clips.thickness) #{ direction }")
    when /^coating_/
    order("LOWER(c_clips.coating) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(c_clips.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(c_clips.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(c_clips.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(c_clips.remark) #{ direction }")
  when /^reason_/
    order("LOWER(c_clips.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_clip_type, lambda { |clip_types| where(clip_type: [*clip_types])}
scope :with_norminal_diameter, lambda { |norminal_diameters| where(norminal_diameter: [*norminal_diameters])}
scope :with_thickness, lambda { |thicknesss| where(thickness: [*thicknesss])}
scope :with_coating, lambda { |coatings| where(coating: [*coatings])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
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
  where("LOWER(c_clips.partnumber) LIKE ? OR LOWER(c_clips.description) LIKE ? OR LOWER(c_clips.clip_type) LIKE ?
          OR LOWER(c_clips.norminal_diameter) LIKE ? OR LOWER(c_clips.thickness) LIKE ? OR LOWER(c_clips.coating) LIKE ?
           OR LOWER(c_clips.drawing_norm) LIKE ? OR LOWER(c_clips.where_used_product) LIKE ? OR LOWER(c_clips.where_used_plant) LIKE ?
            OR LOWER(c_clips.remark) LIKE ? OR LOWER(c_clips.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms)
}

end