class BrushHolderImportsController < ApplicationController
  def new
    @brush_holder_import = BrushHolderImport.new
  end

  def create
    @brush_holder_import = BrushHolderImport.new(params[:brush_holder_import])
    if @brush_holder_import.save
      redirect_to brush_holders_url, notice: "Imported Brush holders successfully."
    else
      render :new
    end
  end
end
