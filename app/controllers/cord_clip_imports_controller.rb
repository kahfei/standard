class CordClipImportsController < ApplicationController
  def new
    @cord_clip_import = CordClipImport.new
  end

  def create
    @cord_clip_import = CordClipImport.new(params[:cord_clip_import])
    if @cord_clip_import.save
      redirect_to cord_clips_url, notice: "Imported Cord clips successfully."
    else
      render :new
    end
  end
end
