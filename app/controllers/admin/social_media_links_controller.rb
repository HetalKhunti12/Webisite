class Admin::SocialMediaLinksController < ApplicationController
  before_action :authenticate_contact!
  layout "admin"
  
  before_action :set_admin_social_media_link, only: [:show, :edit, :update, :destroy]

  
  def index
    @social_media_links = SocialMediaLink.all
  end

  def show
  end

  
  def new
    @social_media_link = SocialMediaLink.new
  end

  
  def edit
  end

  
  def create
    @social_media_link = SocialMediaLink.new(admin_social_media_link_params)

    respond_to do |format|
      if @social_media_link.save
        format.html { redirect_to admin_social_media_links_url, notice: 'Social media link was successfully created.' }
        format.json { render :show, status: :created, location: @social_media_link }
      else
        format.html { render :new }
        format.json { render json: @social_media_link.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @social_media_link.update(admin_social_media_link_params)
        format.html { redirect_to @social_media_link, notice: 'Social media link was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_media_link }
      else
        format.html { render :edit }
        format.json { render json: @social_media_link.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @social_media_link.destroy
    respond_to do |format|
      format.html { redirect_to admin_social_media_links_url, notice: 'Social media link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_admin_social_media_link
      @social_media_link = SocialMediaLink.find(params[:id])
    end

    def admin_social_media_link_params
      params.require(:social_media_link).permit(:name, :link)
    end
end
