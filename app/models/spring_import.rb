class SpringImport
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
		if imported_springs.map(&:valid?).all? 
			save_uniq_record(Spring, imported_springs)
		else
			imported_springs.each_with_index do |spring, index|
				spring.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_springs
		@imported_springs ||= load_imported_springs
	end

	def load_imported_springs
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		springs = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			spring = Spring.find_by_id(row["id"]) || Spring.new
			spring.attributes = row.to_hash.slice(*Spring.accessible_attributes)
			springs << spring
		end
		springs
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