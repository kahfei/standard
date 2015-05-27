module ValidateMethods
	extend ActiveSupport::Concern
		
	included do
		validates :partnumber, :presence => true
    	validates :partnumber, length: { is: 10 }
    	validates :partnumber, :uniqueness => { :scope => :where_used_plant }
    	validates_presence_of self.column_names - (self.column_names.select { |c| c.start_with? "need_to_edit" } << ["created_at","id","updated_at","uploaded_by_section","uploader_role","uploader_name"]).flatten
		# loop thru all float fields and perform 3 max decimal points validation
		float_fields = self.columns.select {|c| c.type == :float}
		for c in float_fields
			validates_format_of c.name, :with => /\A\d+\.\d{0,3}\Z/i, :message => "value should not exceed 3 decimal points"
		end

		

	end

end