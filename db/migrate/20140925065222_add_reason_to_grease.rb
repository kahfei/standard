class AddReasonToGrease < ActiveRecord::Migration
  def change
    add_column :greases, :reason, :string
  end
end
