class ConnectorImport
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
		if imported_connectors.map(&:valid?).all? 
			save_uniq_record(Connector, imported_connectors)
		else
			imported_connectors.each_with_index do |connector, index|
				connector.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_connectors
		@imported_connectors ||= load_imported_connectors
	end

	def load_imported_connectors
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		connectors = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			connector = Connector.find_by_id(row["id"]) || Connector.new
			connector.attributes = row.to_hash.slice(*Connector.accessible_attributes)
			connectors << connector
		end
		connectors
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