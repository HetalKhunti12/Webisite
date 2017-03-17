class ProfileVideosController < ApplicationController
  before_action :set_profile_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_contact!
  
  # GET /profile_videos
  # GET /profile_videos.json
  def index
    @profile_videos = ProfileVideo.all
  end

  # GET /profile_videos/1
  # GET /profile_videos/1.json
  def show
  end

  # GET /profile_videos/new
  def new
    @profile_video = ProfileVideo.new
  end

  # GET /profile_videos/1/edit
  def edit
  end

  # POST /profile_videos
  # POST /profile_videos.json
  def create
    @profile_video = ProfileVideo.new(profile_video_params)

    respond_to do |format|
      if @profile_video.save
        format.html { redirect_to profile_videos_url, notice: 'Profile video was successfully created.' }
        format.json { render :show, status: :created, location: @profile_video }
      else
        format.html { render :new }
        format.json { render json: @profile_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_videos/1
  # PATCH/PUT /profile_videos/1.json
  def update
    respond_to do |format|
      if @profile_video.update(profile_video_params)
        format.html { redirect_to profile_videos_url, notice: 'Profile video was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_video }
      else
        format.html { render :edit }
        format.json { render json: @profile_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_videos/1
  # DELETE /profile_videos/1.json
  def destroy
    @profile_video.destroy
    respond_to do |format|
      format.html { redirect_to profile_videos_url, notice: 'Profile video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_video
      @profile_video = ProfileVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_video_params
      params.require(:profile_video).permit(:video, :title, :description, :artist_profile_id)
    end
end
