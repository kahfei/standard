class CordImport
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
		if imported_cords.map(&:valid?).all? 
			save_uniq_record(Cord, imported_cords)
		else
			imported_cords.each_with_index do |cord, index|
				cord.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_cords
		@imported_cords ||= load_imported_cords
	end

	def load_imported_cords
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		cords = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			cord = Cord.find_by_id(row["id"]) || Cord.new
			cord.attributes = row.to_hash.slice(*Cord.accessible_attributes)
			cords << cord
		end
		cords
	end

	def open_spreadsheet
		case File.extname(file.original_filename)
		when ".csv" then Roo::CSV.new(file.path)
		when ".xls" then Roo::Excel.new(file.path)
		when ".xlsx" then Roo::Excelx.new(file.path)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end

end