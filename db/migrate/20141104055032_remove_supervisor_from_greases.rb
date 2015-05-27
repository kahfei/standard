class RemoveSupervisorFromGreases < ActiveRecord::Migration
  def change
  	remove_column :greases, :supervisor
  end
end
