class ScrewImportsController < ApplicationController
  def new
    @screw_import = ScrewImport.new
  end

  def create
    @screw_import = ScrewImport.new(params[:screw_import])
    if @screw_import.save
      redirect_to screws_url, notice: "Imported Screws successfully."
    else
      render :new
    end
  end
end
