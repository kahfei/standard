class AcMotorImportsController < ApplicationController
  def new
    @ac_motor_import = AcMotorImport.new
  end

  def create
    @ac_motor_import  = AcMotorImport.new(params[:ac_motor_import])
    if @ac_motor_import.save
      redirect_to ac_motors_url, notice: "Imported AC Motors successfully."
    else
      render :new
    end
  end
  
end




