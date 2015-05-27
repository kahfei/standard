class WasherImportsController < ApplicationController
  def new
    @washer_import = WasherImport.new
  end

  def create
    @washer_import = WasherImport.new(params[:washer_import])
    if @washer_import.save
      redirect_to washers_url, notice: "Imported Washers successfully."
    else
      render :new
    end
  end
end
