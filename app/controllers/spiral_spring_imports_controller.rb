class SpiralSpringImportsController < ApplicationController
  def new
    @spiral_spring_import = SpiralSpringImport.new
  end

  def create
    @spiral_spring_import = SpiralSpringImport.new(params[:spiral_spring_import])
    if @spiral_spring_import.save
      redirect_to spiral_springs_url, notice: "Imported Spiral springs successfully."
    else
      render :new
    end
  end
end
