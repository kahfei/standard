class RenameAnchorLogoPartnumberToPartnumber < ActiveRecord::Migration
  def change
  	rename_column :anchor_logos, :anchor_logo_partnumber, :partnumber
  end
end
