class GreaseImportsController < ApplicationController
  def new
    @grease_import = GreaseImport.new
  end

  def create
    @grease_import = GreaseImport.new(params[:grease_import])
    if @grease_import.save
      redirect_to greases_url, notice: "Imported Greases successfully."
    else
      render :new
    end
  end
end
