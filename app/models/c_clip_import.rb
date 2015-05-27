class CClipImport
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
		if imported_c_clips.map(&:valid?).all? 
			save_uniq_record(CClip, imported_c_clips)
		else
			imported_c_clips.each_with_index do |c_clip, index|
				c_clip.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_c_clips
		@imported_c_clips ||= load_imported_c_clips
	end

	def load_imported_c_clips
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		c_clips = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			c_clip = CClip.find_by_id(row["id"]) || CClip.new
			c_clip.attributes = row.to_hash.slice(*CClip.accessible_attributes)
			c_clips << c_clip
		end
		c_clips
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