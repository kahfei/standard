class AcMotorImport
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
		if imported_ac_motors.map(&:valid?).all? 
			save_uniq_record(AcMotor, imported_ac_motors)
		else
			imported_ac_motors.each_with_index do |ac_motor, index|
				ac_motor.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end


	def imported_ac_motors
		@imported_ac_motors ||= load_imported_ac_motors
	end

	def load_imported_ac_motors
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		ac_motors = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			ac_motor = AcMotor.find_by_id(row["id"]) || AcMotor.new
			ac_motor.attributes = row.to_hash.slice(*AcMotor.accessible_attributes)
			ac_motors << ac_motor
		end
		ac_motors
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