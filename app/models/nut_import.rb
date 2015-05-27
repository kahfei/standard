class NutImport
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
		if imported_nuts.map(&:valid?).all? 
			save_uniq_record(Nut, imported_nuts)
		else
			imported_nuts.each_with_index do |nut, index|
				nut.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_nuts
		@imported_nuts ||= load_imported_nuts
	end

	def load_imported_nuts
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		nuts = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			nut = Nut.find_by_id(row["id"]) || Nut.new
			nut.attributes = row.to_hash.slice(*Nut.accessible_attributes)
			nuts << nut
		end
		nuts
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