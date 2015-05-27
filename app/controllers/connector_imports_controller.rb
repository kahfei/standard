class ConnectorImportsController < ApplicationController
  def new
    @connector_import = ConnectorImport.new
  end

  def create
    @connector_import = ConnectorImport.new(params[:connector_import])
    if @connector_import.save
      redirect_to connectors_url, notice: "Imported Connectors successfully."
    else
      render :new
    end
  end
end
