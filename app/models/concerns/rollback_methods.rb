module RollbackMethods
    extend ActiveSupport::Concern
        def save_uniq_record(obj, imported_obj)
            begin
                obj.transaction do 
                    imported_obj.each(&:save!)
                    true
                end
            rescue ActiveRecord::RecordInvalid
                errors.add :base, "Found duplicate records in the uploaded file,
                                    nothing will be created."
                false
            end
        end

end
