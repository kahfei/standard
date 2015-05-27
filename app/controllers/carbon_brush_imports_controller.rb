class CarbonBrushImportsController < ApplicationController
  def new
    @carbon_brush_import = CarbonBrushImport.new
  end

  def create
    @carbon_brush_import = CarbonBrushImport.new(params[:carbon_brush_import])
    if @carbon_brush_import.save
      redirect_to carbon_brushes_url, notice: "Imported Carbon brushes successfully."
    else
      render :new
    end
  end
end
