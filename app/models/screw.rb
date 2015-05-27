class Screw < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants

  
  	after_initialize :init

  	

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or screw_drive LIKE ? or screw_head LIKE ? or thread_type LIKE ? 
        or drawing_norm LIKE ? or screw_size LIKE ? or length LIKE ? 
        or connection_material LIKE ? or coating LIKE ? or where_used_product LIKE ? 
        or where_used_plant LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |screw|
  	  	csv << screw.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","screw_drive","screw_head","thread_type",
    	"screw_size","length","connection_material","coating","drawing_norm",
    	"where_used_product","where_used_plant","remark","reason"]
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
      :with_screw_drive,
      :with_screw_head,
      :with_thread_type,
      :with_screw_size,
      :with_length,
      :with_connection_material,
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

  def self.screw_drives_for_select
    order('LOWER(screw_drive)').map { |e| [e.screw_drive, e.screw_drive] }.uniq
  end

  def self.screw_heads_for_select
    order('LOWER(screw_head)').map { |e| [e.screw_head, e.screw_head] }.uniq
  end

  def self.thread_types_for_select
    order('LOWER(thread_type)').map { |e| [e.thread_type, e.thread_type] }.uniq
  end

  def self.screw_sizes_for_select
    order('LOWER(screw_size)').map { |e| [e.screw_size, e.screw_size] }.uniq
  end

  def self.lengths_for_select
    order('LOWER(length)').map { |e| [e.length, e.length] }.uniq
  end

  def self.connection_materials_for_select
    order('LOWER(connection_material)').map { |e| [e.connection_material, e.connection_material] }.uniq
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
    order("screws.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(screws.partnumber) #{ direction }")
    when /^description_/
    order("LOWER(screws.description) #{ direction }")
    when /^screw_drive_/
    order("LOWER(screws.screw_drive) #{ direction }")
    when /^screw_head_/
    order("LOWER(screws.screw_head) #{ direction }")
    when /^thread_type_/
    order("LOWER(screws.thread_type) #{ direction }")
    when /^screw_size_/
    order("LOWER(screws.screw_size) #{ direction }")
    when /^length_/
    order("LOWER(screws.length) #{ direction }")
    when /^connection_material_/
    order("LOWER(screws.connection_material) #{ direction }")
    when /^coating_/
    order("LOWER(screws.coating) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(screws.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(screws.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(screws.where_used_plant) #{ direction }")
    when /^remark_/
    order("LOWER(screws.remark) #{ direction }")
    when /^reason_/
    order("LOWER(screws.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_screw_drive, lambda { |screw_drives| where(screw_drive: [*screw_drives])}
scope :with_screw_head, lambda { |screw_heads| where(screw_head: [*screw_heads])}
scope :with_thread_type, lambda { |thread_types| where(thread_type: [*thread_types])}
scope :with_screw_size, lambda { |screw_sizes| where(screw_size: [*screw_sizes])}
scope :with_length, lambda { |lengths| where(length: [*lengths])}
scope :with_connection_material, lambda { |connection_materials| where(connection_material: [*connection_materials])}
scope :with_coating, lambda { |coatings| where(coating: [*coatings])}
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
  where("LOWER(screws.partnumber) LIKE ? OR LOWER(screws.description) LIKE ? OR LOWER(screws.screw_drive) LIKE ?
         OR LOWER(screws.screw_head) LIKE ? OR LOWER(screws.thread_type) LIKE ? OR LOWER(screws.screw_size) LIKE ?
          OR LOWER(screws.length) LIKE ? OR LOWER(screws.connection_material) LIKE ? OR LOWER(screws.coating) LIKE ?
           OR LOWER(screws.drawing_norm) LIKE ? OR LOWER(screws.where_used_product) LIKE ? OR LOWER(screws.where_used_plant) LIKE ?
            OR LOWER(screws.remark) LIKE ? OR LOWER(screws.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms)
}

end
