class BearingImport
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
		if imported_bearings.map(&:valid?).all? 
			save_uniq_record(Bearing, imported_bearings)
		else
			imported_bearings.each_with_index do |bearing, index|
				bearing.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end


	def imported_bearings
		@imported_bearings ||= load_imported_bearings
	end

	def load_imported_bearings
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		bearings = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			bearing = Bearing.find_by_id(row["id"]) || Bearing.new
			bearing.attributes = row.to_hash.slice(*Bearing.accessible_attributes)
			bearings << bearing
		end
		bearings
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