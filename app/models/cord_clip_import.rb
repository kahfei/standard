class CordClipImport
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
		if imported_cord_clips.map(&:valid?).all? 
			save_uniq_record(CordClip, imported_cord_clips)
		else
			imported_cord_clips.each_with_index do |cord_clip, index|
				cord_clip.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
		end
	end

	def imported_cord_clips
		@imported_cord_clips ||= load_imported_cord_clips
	end

	def load_imported_cord_clips
		spreadsheet = open_spreadsheet
		header = spreadsheet.row(1)
		cord_clips = []
		(2..spreadsheet.last_row).map do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			cord_clip = CordClip.find_by_id(row["id"]) || CordClip.new
			cord_clip.attributes = row.to_hash.slice(*CordClip.accessible_attributes)
			cord_clips << cord_clip
		end
		cord_clips
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