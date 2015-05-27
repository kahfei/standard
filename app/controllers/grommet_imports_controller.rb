class GrommetImportsController < ApplicationController
  def new
    @grommet_import = GrommetImport.new
  end

  def create
    @grommet_import = GrommetImport.new(params[:grommet_import])
    if @grommet_import.save
      redirect_to grommets_url, notice: "Imported Grommets successfully."
    else
      render :new
    end
  end
end
