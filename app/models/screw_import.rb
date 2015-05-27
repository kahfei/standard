class ScrewImport
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
		if imported_screws.map(&:valid?).all? 
			save_uniq_record(Screw, imported_screws)
		else
			imported_screws.each_with_index do |screw, index|
				screw.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_screws
		@imported_screws ||= load_imported_screws
	end

	def load_imported_screws
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		screws = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			screw = Screw.find_by_id(row["id"]) || Screw.new
			screw.attributes = row.to_hash.slice(*Screw.accessible_attributes)
			screws << screw
		end
		screws
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