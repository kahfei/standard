class CordClipsController < ApplicationController
  # GET /cord_clips
  # GET /cord_clips.xml
  def index
    @filterrific = initialize_filterrific(
      CordClip, 
      params[:filterrific],
      select_options: {
      sorted_by: CordClip.options_for_sorted_by,
      with_partnumber: CordClip.partnumbers_for_select,
      with_description: CordClip.descriptions_for_select,
      with_cord_clip_type: CordClip.cord_clip_types_for_select,
      with_material: CordClip.materials_for_select,
      with_max_cord_od: CordClip.max_cord_ods_for_select,
      with_drawing_norm: CordClip.drawing_norms_for_select,
      with_where_used_product: CordClip.where_used_products_for_select,
      with_where_used_plant: CordClip.where_used_plants_for_select,
      with_remark: CordClip.remarks_for_select,
      with_reason: CordClip.reasons_for_select
    }) or return
    @cord_clips = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /cord_clips/1
  # GET /cord_clips/1.xml
  def show
    @cord_clip = CordClip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cord_clip }
    end
  end

  # GET /cord_clips/new
  # GET /cord_clips/new.xml
  def new
    @cord_clip = CordClip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cord_clip }
    end
  end

  # GET /cord_clips/1/edit
  def edit
    @cord_clip = CordClip.find(params[:id])
    @object = CordClip.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = CordClip.find(params[:id])
    render 'shared/correct'
  end

  # POST /cord_clips
  # POST /cord_clips.xml
  def create
    @cord_clip = CordClip.new(cord_clip_params)

    @cord_clip.uploaded_by_section = session[:user_section]
    @cord_clip.uploader_role = session[:user_role]
    @cord_clip.uploader_name = session[:user_name]
    @cord_clip.release_status = "pending"

    respond_to do |format|
      if @cord_clip.save
        format.html { redirect_to(@cord_clip, :notice => 'Cord clip was successfully created.') }
        format.xml  { render :xml => @cord_clip, :status => :created, :location => @cord_clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cord_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cord_clips/1
  # PUT /cord_clips/1.xml
  def update
    @cord_clip = CordClip.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @cord_clip.release_status = "needs editing"
    else
      @cord_clip.release_status = "pending"
    end
    respond_to do |format|
      if @cord_clip.update_attributes(cord_clip_params)
        format.html { redirect_to(@cord_clip, :notice => 'Cord clip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cord_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @cord_clip = CordClip.find(params[:id])
    @cord_clip.release_status = "approved draft"
    @cord_clip.save
    respond_to do |format|
      format.html { redirect_to(cord_clips_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @cord_clip = CordClip.find(params[:id])
    @cord_clip.release_status = "released"
    @cord_clip.save
    respond_to do |format|
      format.html { redirect_to(cord_clips_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @cord_clip = CordClip.find(params[:id])
    @cord_clip.release_status = "block"
    @cord_clip.save
    respond_to do |format|
      format.html { redirect_to(cord_clips_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @cord_clip = CordClip.find(params[:id])
    @cord_clip.release_status = "released"
    @cord_clip.save
    respond_to do |format|
      format.html { redirect_to(cord_clips_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = CordClip.find(params[:id])
    render 'shared/needs_editing'
  end
  # DELETE /cord_clips/1
  # DELETE /cord_clips/1.xml
  def destroy
    @cord_clip = CordClip.find(params[:id])
    @cord_clip.destroy

    respond_to do |format|
      format.html { redirect_to(cord_clips_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_cord_clips] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_cord_clip
      @cord_clip = CordClip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cord_clip_params
      params.require(:cord_clip).permit(:id, :partnumber, :description, :cord_clip_type, 
        :material, :max_cord_od, :drawing_norm, :where_used_product, :where_used_plant, 
        :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_cord_clip_type, 
        :need_to_edit_material, :need_to_edit_max_cord_od, :need_to_edit_drawing_norm, 
        :need_to_edit_where_used_product, :need_to_edit_where_used_plant, 
        :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end