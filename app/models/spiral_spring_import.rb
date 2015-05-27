class SpiralSpringImport
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
		if imported_spiral_springs.map(&:valid?).all? 
			save_uniq_record(SpiralSpring, imported_spiral_springs)
		else
			imported_spiral_springs.each_with_index do |spiral_spring, index|
				spiral_spring.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_spiral_springs
		@imported_spiral_springs ||= load_imported_spiral_springs
	end

	def load_imported_spiral_springs
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		spiral_springs = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			spiral_spring = SpiralSpring.find_by_id(row["id"]) || SpiralSpring.new
			spiral_spring.attributes = row.to_hash.slice(*SpiralSpring.accessible_attributes)
			spiral_springs << spiral_spring
		end
		spiral_springs
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