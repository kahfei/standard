class WasherImport
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
		if imported_washers.map(&:valid?).all? 
			save_uniq_record(Washer, imported_washers)
		else
			imported_washers.each_with_index do |washer, index|
				washer.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_washers
		@imported_washers ||= load_imported_washers
	end

	def load_imported_washers
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		washers = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			washer = Washer.find_by_id(row["id"]) || Washer.new
			washer.attributes = row.to_hash.slice(*Washer.accessible_attributes)
			washers << washer
		end
		washers
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