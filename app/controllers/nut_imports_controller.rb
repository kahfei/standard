class NutImportsController < ApplicationController
  def new
    @nut_import = NutImport.new
  end

  def create
    @nut_import = NutImport.new(params[:nut_import])
    if @nut_import.save
      redirect_to nuts_url, notice: "Imported Nuts successfully."
    else
      render :new
    end
  end
end
