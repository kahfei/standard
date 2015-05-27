class CapacitorImportsController < ApplicationController
  def new
    @capacitor_import = CapacitorImport.new
  end

  def create
    @capacitor_import = CapacitorImport.new(params[:capacitor_import])
    if @capacitor_import.save
      redirect_to capacitors_url, notice: "Imported Capacitors successfully."
    else
      render :new
    end
  end
end
