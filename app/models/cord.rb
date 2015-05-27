class Cord < ActiveRecord::Base

   include ValidateMethods
   include CommonConstants
  	after_initialize :init

  	POLARITY = [nil, "No", "Yes"]
  

    self.per_page = 15

  	def self.search(query)
  		where('release_status LIKE ? or partnumber LIKE ? or description LIKE ? 
        or cord_mat LIKE ? or cord_type LIKE ? or plug_type LIKE ? 
        or polarity LIKE ? or cross_sec LIKE ? or cord_od LIKE ? 
        or length LIKE ? or dismantled_length LIKE ? or switch_con LIKE ? 
        or drawing_norm LIKE ? or where_used_product LIKE ? 
        or where_used_plant LIKE ? or cord_spec LIKE ? or remark LIKE ? or reason LIKE ?',
  		"%#{query}%", "%#{query}%", "%#{query}%" , "%#{query}%", "%#{query}%" , 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", 
      "%#{query}%", "%#{query}%", "%#{query}%")
	end

	def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |cord|
  	  	csv << cord.attributes.values_at(*column_names)
  	  end
  	end
  end

  def self.accessible_attributes
    ["id","partnumber","description","cord_mat","cord_type","plug_type","polarity","cross_sec",
    	"cord_od", "length", "dismantled_length", "switch_con","drawing_norm",
    	"where_used_product","where_used_plant","cord_spec","remark","reason"]
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
      :with_cord_mat,
      :with_cord_type,
      :with_plug_type,
      :with_polarity,
      :with_cross_sec,
      :with_cord_od,
      :with_length,
      :with_dismantled_length,
      :with_switch_con,
      :with_drawing_norm,
      :with_where_used_product,
      :with_where_used_plant,
      :with_cord_spec,
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

  def self.cord_mats_for_select
    order('LOWER(cord_mat)').map { |e| [e.cord_mat, e.cord_mat] }.uniq
  end

  def self.cord_types_for_select
    order('LOWER(cord_type)').map { |e| [e.cord_type, e.cord_type] }.uniq
  end

  def self.plug_types_for_select
    order('LOWER(plug_type)').map { |e| [e.plug_type, e.plug_type] }.uniq
  end

  def self.polaritys_for_select
    order('LOWER(polarity)').map { |e| [e.polarity, e.polarity] }.uniq
  end

  def self.cross_secs_for_select
    order('LOWER(cross_sec)').map { |e| [e.cross_sec, e.cross_sec] }.uniq
  end

  def self.cord_ods_for_select
    order('LOWER(cord_od)').map { |e| [e.cord_od, e.cord_od] }.uniq
  end

  def self.lengths_for_select
    order('LOWER(length)').map { |e| [e.length, e.length] }.uniq
  end

  def self.dismantled_lengths_for_select
    order('LOWER(dismantled_length)').map { |e| [e.dismantled_length, e.dismantled_length] }.uniq
  end

  def self.switch_cons_for_select
    order('LOWER(switch_con)').map { |e| [e.switch_con, e.switch_con] }.uniq
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

  def self.cord_specs_for_select
    order('LOWER(cord_spec)').map { |e| [e.cord_spec, e.cord_spec] }.uniq
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
    order("cords.created_at #{ direction }")
    when /^partnumber_/
    order("LOWER(cords.partnumber) #{ direction }")
    when /^descriptions_/
    order("LOWER(cords.description) #{ direction }")
    when /^cord_mat_/
    order("LOWER(cords.cord_mat) #{ direction }")
    when /^cord_type_/
    order("LOWER(cords.cord_type) #{ direction }")
    when /^plug_type_/
    order("LOWER(cords.plug_type) #{ direction }")
    when /^polarity_/
    order("LOWER(cords.polarity) #{ direction }")
    when /^cross_sec_/
    order("LOWER(cords.cross_sec) #{ direction }")
    when /^cord_od_/
    order("LOWER(cords.cord_od) #{ direction }")
    when /^length_/
    order("LOWER(cords.length) #{ direction }")
    when /^dismantled_length_/
    order("LOWER(cords.dismantled_length) #{ direction }")
    when /^switch_con_/
    order("LOWER(cords.switch_con) #{ direction }")
    when /^drawing_norm_/
    order("LOWER(cords.drawing_norm) #{ direction }")
    when /^where_used_product_/
    order("LOWER(cords.where_used_product) #{ direction }")
    when /^where_used_plant_/
    order("LOWER(cords.where_used_plant) #{ direction }")
    when /^cord_spec_/
    order("LOWER(cords.cord_spec) #{ direction }")
    when /^remark_/
    order("LOWER(cords.remark) #{ direction }")
    when /^reason_/
    order("LOWER(cords.reason) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
    
  }
scope :with_partnumber, lambda { |partnumbers| where(partnumber: [*partnumbers])}
scope :with_description, lambda { |descriptions| where(description: [*descriptions])}
scope :with_cord_mat, lambda { |cord_mats| where(cord_mat: [*cord_mats])}
scope :with_cord_type, lambda { |cord_types| where(cord_type: [*cord_types])}
scope :with_plug_type, lambda { |plug_types| where(plug_type: [*plug_types])}
scope :with_polarity, lambda { |polaritys| where(polarity: [*polaritys])}
scope :with_cross_sec, lambda { |cross_secs| where(cross_sec: [*cross_secs])}
scope :with_cord_od, lambda { |cord_ods| where(cord_od: [*cord_ods])}
scope :with_length, lambda { |lengths| where(length: [*lengths])}
scope :with_dismantled_length, lambda { |dismantled_lengths| where(dismantled_length: [*dismantled_lengths])}
scope :with_switch_con, lambda { |switch_cons| where(switch_con: [*switch_cons])}
scope :with_drawing_norm, lambda { |drawing_norms| where(drawing_norm: [*drawing_norms])}
scope :with_where_used_product, lambda { |where_used_products| where(where_used_product: [*where_used_products])}
scope :with_where_used_plant, lambda { |where_used_plants| where(where_used_plant: [*where_used_plants])}
scope :with_cord_spec, lambda { |cord_specs| where(cord_spec: [*cord_specs])}
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
  where("LOWER(cords.partnumber) LIKE ? OR LOWER(cords.description) LIKE ? OR LOWER(cords.cord_mat) LIKE ?
         OR LOWER(cords.cord_type) LIKE ? OR LOWER(cords.plug_type) LIKE ? OR LOWER(cords.polarity) LIKE ?
          OR LOWER(cords.cross_sec) LIKE ? OR LOWER(cords.cord_od) LIKE ? OR LOWER(cords.length) LIKE ?
           OR LOWER(cords.dismantled_length) LIKE ? OR LOWER(cords.switch_con) LIKE ?
            OR LOWER(cords.drawing_norm) LIKE ? OR LOWER(cords.where_used_product) LIKE ? OR LOWER(cords.where_used_plant) LIKE ?
             OR LOWER(cords.cord_spec) LIKE ? OR LOWER(cords.remark) LIKE ? OR LOWER(cords.reason) LIKE ?",
             terms, terms, terms, terms, terms, terms, terms, terms, 
             terms, terms, terms, terms, terms, terms, terms, terms, terms)
}

end



