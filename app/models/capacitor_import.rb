class CapacitorImport
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
		if imported_capacitors.map(&:valid?).all? 
			save_uniq_record(Capacitor, imported_capacitors)
		else
			imported_capacitors.each_with_index do |capacitor, index|
				capacitor.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_capacitors
		@imported_capacitors ||= load_imported_capacitors
	end

	def load_imported_capacitors
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		capacitors = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			capacitor = Capacitor.find_by_id(row["id"]) || Capacitor.new
			capacitor.attributes = row.to_hash.slice(*Capacitor.accessible_attributes)
			capacitors << capacitor
		end
		capacitors
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