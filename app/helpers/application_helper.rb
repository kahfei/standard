module ApplicationHelper
 def sortable(column, title= nil )
   title ||= column.titleize
   css_class = (column == sort_column) ? "current #{sort_direction}" : nil
   direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
   link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}  
 end

 def part_status(obj)
 	if obj.release_status == "pending"
 		case obj.uploader_role
 			when 'Normal'
 				content_tag(:div, "Part pending first approval from #{obj.uploaded_by_section} Section Head", id: 'part_status')
 			when 'Sectionhead'
 				content_tag(:div, "Part pending first approval from Department Head", id: 'part_status')
 		end
 	elsif obj.release_status == "approved draft"
 		case obj.uploader_role
 			when 'Normal'
 				content_tag(:div, "Part pending second approval from #{obj.uploaded_by_section} Section Head", id: 'part_status')
 			when 'Sectionhead'
 				content_tag(:div, "Part pending second approval from Department Head", id: 'part_status')
 		end
 	elsif obj.release_status == "needs editing"
 		content_tag(:div, "Part need further edit from #{obj.uploader_name}", id: 'part_status')
 	end
 end

def pending_objs_from_same_section(*objs)
	arr = []
	objs.each do |obj|
		arr << obj.where("release_status = ? AND uploaded_by_section = ? AND uploader_role = ? ","pending", session[:user_section], "Normal").to_a
	end
	arr
end

def approved_objs_from_same_section(*objs)
	arr = []
	objs.each do |obj|
		arr << obj.where("release_status = ? AND uploaded_by_section = ? AND uploader_role = ? ","approved draft", session[:user_section], "Normal").to_a
	end
	arr
end

def pending_objs_from_section_head(*objs)
	arr = []
	objs.each do |obj|
		arr << obj.where("release_status = ? AND uploader_role = ? ","pending", "Sectionhead").to_a
	end
	arr
end

def approved_objs_from_section_head(*objs)
	arr = []
	objs.each do |obj|
		arr << obj.where("release_status = ? AND uploader_role = ? ","approved draft", "Sectionhead").to_a
	end
	arr
end

def need_edit_objs(*objs)
	arr = []
	objs.each do |obj|
		arr << obj.where("release_status = ? AND uploader_name = ? ","needs editing", session[:user_name]).to_a
	end
	arr
end

 def is_superadmin?
 	session[:user_role] == "Superadmin"
 end

  def is_normal?
 	session[:user_role] == "Normal"
 end

 def is_creator?(name)
 	name == session[:user_name]
 end

 def is_section_head?
 	session[:user_role] == "Sectionhead"
 end

 def is_department_head?
	session[:user_role] == "Departmenthead"
 end

 def is_needs_editing?(status)
 	status == "needs editing"
 end

 def is_pending?(status)
 	status == "pending"
 end

 def is_approved_draft?(status)
 	status == "approved draft"
 end

 def is_released?(status)
	status == "released"
 end

 def is_blocked?(status)
 	status == "block"
 end

 def uploader_from_same_section(section)
 	section == session[:user_section]
 end

 def editable?(obj)
 	if is_superadmin?
 		true
 	elsif obj.release_status == "pending"
 		if is_creator?(obj.uploader_name)
 			true
 		end
 	elsif obj.release_status == "approved draft"
 		if obj.uploader_role == "Normal"
 			if (is_section_head? && uploader_from_same_section(obj.uploaded_by_section))
 				true
 			end
 		elsif obj.uploader_role == "Sectionhead"
 			if session[:user_role] == "Departmenthead"
 				true
 			end
 		end
 	end
 end

 def correctable?(obj)
 	if obj.release_status == "needs editing"
 		if is_creator?(obj.uploader_name)
 			true
 		end
 	end
 end

# set part status approve draft
 def approvable?(obj)
 	if is_pending?(obj.release_status)
 		if is_section_head?
 			if obj.uploader_role == 'Normal' && uploader_from_same_section(obj.uploaded_by_section)
 				true
 			end
 		elsif is_department_head?
 			if obj.uploader_role == 'Sectionhead'
 				true
 			end
 		end
 	end
 end

# set part status to released
 def releasable?(obj)
 	if is_approved_draft?(obj.release_status)
 		if is_section_head?
 			if (obj.uploader_role == 'Normal' && uploader_from_same_section(obj.uploaded_by_section))
 				true
 			end
 		elsif is_department_head?
 			if obj.uploader_role == 'Sectionhead'
 				true
 			end
 		end
 	end
 end

 # def blockable?(obj)
 # 	if is_section_head?
 # 		if is_released?(obj.release_status)
 # 			true
 # 		end
 # 	end
 # end

 def blockable?(obj)
 	if is_released?(obj.release_status)
 		if obj.uploader_role == "Sectionhead" && is_department_head?
 		  true
 		elsif obj.uploader_role == "Normal" && is_section_head?
 		  true
 		end
 	end
 		 	 
 end

 def unblockable?(obj)
 	if is_department_head?
 		if is_blocked?(obj.release_status)
 			true
 		end
 	end
 end

 # list all editable fields in a model
 def editable_fields(obj)
 	obj.attributes.select {|key| key.start_with? "need_to_edit_"}
 end
# list all editable fields that marked need to be edited
 def fields_need_editing(obj) 
 	editable_fields(obj).select {|k,v| v == true }
 end 


end

