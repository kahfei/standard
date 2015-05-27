class GreaseImport
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
		if imported_greases.map(&:valid?).all? 
			save_uniq_record(Grease, imported_greases)
		else
			imported_greases.each_with_index do |grease, index|
				grease.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_greases
		@imported_greases ||= load_imported_greases
	end

	def load_imported_greases
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		greases = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			grease = Grease.find_by_id(row["id"]) || Grease.new
			grease.attributes = row.to_hash.slice(*Grease.accessible_attributes)
			greases << grease
		end
		greases
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