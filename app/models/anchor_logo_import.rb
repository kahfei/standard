class AnchorLogoImport
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include RollbackMethods
  attr_accessor :file
  


	def initialize(attributes = {})
		attributes.each {|name, value| send("#{name}=", value)}
	end

	def persisted?
		false
	end

	def save
		if imported_anchor_logos.map(&:valid?).all? 
			save_uniq_record(AnchorLogo, imported_anchor_logos)
		else
			imported_anchor_logos.each_with_index do |anchor_logo, index|
				anchor_logo.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end


	def imported_anchor_logos
		@imported_anchor_logos ||= load_imported_anchor_logos
	end

	def load_imported_anchor_logos
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		anchor_logos = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			anchor_logo = AnchorLogo.find_by_id(row["id"]) || AnchorLogo.new
			anchor_logo.attributes = row.to_hash.slice(*AnchorLogo.accessible_attributes)
			anchor_logos << anchor_logo
		end
		anchor_logos
	end

	def open_spreadsheet
		case File.extname(file.original_filename)
			when ".csv" then Roo::Csv.new(file.path)
			when ".xls" then Roo::Excel.new(file.path)
			when ".xlsx" then Roo::Excelx.new(file.path)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end


end