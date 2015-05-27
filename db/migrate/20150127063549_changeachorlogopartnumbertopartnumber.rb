class Changeachorlogopartnumbertopartnumber < ActiveRecord::Migration
  def change
  	rename_column :anchor_logos, :need_to_edit_anchor_logo_partnumber, :need_to_edit_partnumber
  end
end
