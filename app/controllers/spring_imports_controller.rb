class SpringImportsController < ApplicationController
  def new
    @spring_import = SpringImport.new
  end

  def create
    @spring_import = SpringImport.new(params[:spring_import])
    if @spring_import.save
      redirect_to springs_url, notice: "Imported Springs successfully."
    else
      render :new
    end
  end
end
