class CopperwireImportsController < ApplicationController
  def new
    @copperwire_import = CopperwireImport.new
  end

  def create
    @copperwire_import = CopperwireImport.new(params[:copperwire_import])
    if @copperwire_import.save
      redirect_to copperwires_url, notice: "Imported Copperwires successfully."
    else
      render :new
    end
  end
end
