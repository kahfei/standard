class CarbonBrushImport
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
		if imported_carbon_brushes.map(&:valid?).all? 
			save_uniq_record(CarbonBrush, imported_carbon_brushes)
		else
			imported_carbon_brushes.each_with_index do |carbon_brush, index|
				carbon_brush.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_carbon_brushes
		@imported_carbon_brushes ||= load_imported_carbon_brushes
	end

	def load_imported_carbon_brushes
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		carbon_brushes = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			carbon_brush = CarbonBrush.find_by_id(row["id"]) || CarbonBrush.new
			carbon_brush.attributes = row.to_hash.slice(*CarbonBrush.accessible_attributes)
			carbon_brushes << carbon_brush
		end
		carbon_brushes
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