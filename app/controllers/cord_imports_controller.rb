class CordImportsController < ApplicationController
  def new
    @cord_import = CordImport.new
  end

  def create
    @cord_import = CordImport.new(params[:cord_import])
    if @cord_import.save
      redirect_to cords_url, notice: "Imported Cords successfully."
    else
      render :new
    end
  end
end
