class CopperwireImport
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
		if imported_copperwires.map(&:valid?).all? 
			save_uniq_record(Copperwire, imported_copperwires)
		else
			imported_copperwires.each_with_index do |copperwire, index|
				copperwire.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_copperwires
		@imported_copperwires ||= load_imported_copperwires
	end

	def load_imported_copperwires
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		copperwires = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			copperwire = Copperwire.find_by_id(row["id"]) || Copperwire.new
			copperwire.attributes = row.to_hash.slice(*Copperwire.accessible_attributes)
			copperwires << copperwire
		end
		copperwires
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