class CClipsController < ApplicationController
  # GET /c_clips
  # GET /c_clips.xml
  def index
    @filterrific = initialize_filterrific(
    CClip, 
    params[:filterrific],
    select_options: {
      sorted_by: CClip.options_for_sorted_by,
      with_partnumber: CClip.partnumbers_for_select,
      with_description: CClip.descriptions_for_select,
      with_clip_type: CClip.clip_types_for_select,
      with_norminal_diameter: CClip.norminal_diameters_for_select,
      with_thickness: CClip.thicknesss_for_select,
      with_coating: CClip.coatings_for_select,
      with_drawing_norm: CClip.drawing_norms_for_select,
      with_where_used_product: CClip.where_used_products_for_select,
      with_where_used_plant: CClip.where_used_plants_for_select,
      with_remark: CClip.remarks_for_select,
      with_reason: CClip.reasons_for_select
    }) or return
    @c_clips = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :reset_filterrific

  # GET /c_clips/1
  # GET /c_clips/1.xml
  def show
    @c_clip = CClip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @c_clip }
    end
  end

  # GET /c_clips/new
  # GET /c_clips/new.xml
  def new
    @c_clip = CClip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @c_clip }
    end
  end

  # GET /c_clips/1/edit
  def edit
    @c_clip = CClip.find(params[:id])
    @object = CClip.find(params[:id])
    render 'shared/edit'
  end

  def correct
    @object = CClip.find(params[:id])
    render 'shared/correct'
  end

  # POST /c_clips
  # POST /c_clips.xml
  def create
    @c_clip = CClip.new(c_clip_params)
    @c_clip.uploaded_by_section = session[:user_section]
    @c_clip.uploader_role = session[:user_role]
    @c_clip.uploader_name = session[:user_name]
    @c_clip.release_status = "pending"

    respond_to do |format|
      if @c_clip.save
        format.html { redirect_to(@c_clip, :notice => 'C clip was successfully created.') }
        format.xml  { render :xml => @c_clip, :status => :created, :location => @c_clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @c_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /c_clips/1
  # PUT /c_clips/1.xml
  def update
    @c_clip = CClip.find(params[:id])
    if params[:to_needs_editing] # if update call from needs editing, set part status accordingly
      @c_clip.release_status = "needs editing"
    else
      @c_clip.release_status = "pending"
    end
    respond_to do |format|
      if @c_clip.update_attributes(c_clip_params)
        format.html { redirect_to(@c_clip, :notice => 'C clip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @c_clip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @c_clip = CClip.find(params[:id])
    @c_clip.release_status = "approved draft"
    @c_clip.save
    respond_to do |format|
      format.html { redirect_to(c_clips_url) }
      format.xml  { head :ok }
    end
  end

  def release
    @c_clip = CClip.find(params[:id])
    @c_clip.release_status = "released"
    @c_clip.save
    respond_to do |format|
      format.html { redirect_to(c_clips_url) }
      format.xml  { head :ok }
    end
  end

 def block
    @c_clip = CClip.find(params[:id])
    @c_clip.release_status = "block"
    @c_clip.save
    respond_to do |format|
      format.html { redirect_to(c_clips_url) }
      format.xml  { head :ok }
    end
  end

  def unblock
    @c_clip = CClip.find(params[:id])
    @c_clip.release_status = "released"
    @c_clip.save
    respond_to do |format|
      format.html { redirect_to(c_clips_url) }
      format.xml  { head :ok }
    end
  end

  def needs_editing
    @object = CClip.find(params[:id])
    render 'shared/needs_editing'
  end


  # DELETE /c_clips/1
  # DELETE /c_clips/1.xml
  def destroy
    @c_clip = CClip.find(params[:id])
    @c_clip.destroy

    respond_to do |format|
      format.html { redirect_to(c_clips_url) }
      format.xml  { head :ok }
    end
  end

  def reset_filterrific
      # Clear session persistence
      session[:filterrific_c_clips] = nil
      # Redirect back to the index action for default filter settings.
      redirect_to action: :index
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_clip
      @c_clip = CClip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_clip_params
      params.require(:c_clip).permit(:id, :partnumber, :description, :clip_type, 
        :norminal_diameter, :thickness, :coating, :drawing_norm, :where_used_product, 
        :where_used_plant, :remark, :release_status,
        :need_to_edit_partnumber, :need_to_edit_description, :need_to_edit_clip_type, 
        :need_to_edit_norminal_diameter, :need_to_edit_thickness, :need_to_edit_coating, 
        :need_to_edit_drawing_norm, :need_to_edit_where_used_product, 
        :need_to_edit_where_used_plant, :need_to_edit_remark, :need_to_edit_reason,
        :reason)
    end
