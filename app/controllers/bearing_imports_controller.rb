class BearingImportsController < ApplicationController
  def new
    @bearing_import = BearingImport.new
  end

  def create
    @bearing_import = BearingImport.new(params[:bearing_import])
    if @bearing_import.save
      redirect_to bearings_url, notice: "Imported Bearings successfully."
    else
      render :new
    end
  end
end
