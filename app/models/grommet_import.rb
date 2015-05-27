class GrommetImport
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
		if imported_grommets.map(&:valid?).all? 
			save_uniq_record(Grommet, imported_grommets)
		else
			imported_grommets.each_with_index do |grommet, index|
				grommet.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_grommets
		@imported_grommets ||= load_imported_grommets
	end

	def load_imported_grommets
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		grommets = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			grommet = Grommet.find_by_id(row["id"]) || Grommet.new
			grommet.attributes = row.to_hash.slice(*Grommet.accessible_attributes)
			grommets << grommet
		end
		grommets
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