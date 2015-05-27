class PlasticMaterialImportsController < ApplicationController
  def new
    @plastic_material_import = PlasticMaterialImport.new
  end

  def create
    @plastic_material_import = PlasticMaterialImport.new(params[:plastic_material_import])
    if @plastic_material_import.save
      redirect_to plastic_materials_url, notice: "Imported Plastic materials successfully."
    else
      render :new
    end
  end
end
