class PlasticMaterialImport
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
		if imported_plastic_materials.map(&:valid?).all? 
			save_uniq_record(PlasticMaterial, imported_plastic_materials)
		else
			imported_plastic_materials.each_with_index do |plastic_material, index|
				plastic_material.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_plastic_materials
		@imported_plastic_materials ||= load_imported_plastic_materials
	end

	def load_imported_plastic_materials
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		plastic_materials = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			plastic_material = PlasticMaterial.find_by_id(row["id"]) || PlasticMaterial.new
			plastic_material.attributes = row.to_hash.slice(*PlasticMaterial.accessible_attributes)
			plastic_materials << plastic_material
		end
		plastic_materials
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