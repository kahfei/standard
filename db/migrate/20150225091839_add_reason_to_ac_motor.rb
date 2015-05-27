class AddReasonToAcMotor < ActiveRecord::Migration
  def change
  	add_column :ac_motors, :reason, :string
  end
end
