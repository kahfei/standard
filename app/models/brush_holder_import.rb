class BrushHolderImport
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
		if imported_brush_holders.map(&:valid?).all? 
			save_uniq_record(BrushHolder, imported_brush_holders)
		else
			imported_brush_holders.each_with_index do |brush_holder, index|
				brush_holder.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_brush_holders
		@imported_brush_holders ||= load_imported_brush_holders
	end

	def load_imported_brush_holders
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		brush_holders = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			brush_holder = BrushHolder.find_by_id(row["id"]) || BrushHolder.new
			brush_holder.attributes = row.to_hash.slice(*BrushHolder.accessible_attributes)
			brush_holders << brush_holder
		end
		brush_holders
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