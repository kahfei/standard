class CClipImportsController < ApplicationController
  def new
    @c_clip_import = CClipImport.new
  end

  def create
    @c_clip_import = CClipImport.new(params[:c_clip_import])
    if @c_clip_import.save
      redirect_to c_clips_url, notice: "Imported C Clips successfully."
    else
      render :new
    end
  end
end
