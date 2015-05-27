class AnchorLogoImportsController < ApplicationController
  def new
    @anchor_logo_import = AnchorLogoImport.new
  end

  def create
    @anchor_logo_import  = AnchorLogoImport.new(params[:anchor_logo_import])
    if @anchor_logo_import.save
      redirect_to anchor_logos_url, notice: "Imported Anchor Logos successfully."
    else
      render :new
    end
  end
  
end




