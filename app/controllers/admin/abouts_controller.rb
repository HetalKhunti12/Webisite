class Admin::AboutsController < ApplicationController
  before_action :authenticate_contact!
  before_action :set_aboutus, only: [:show, :edit, :update, :destroy]

   layout "admin"

  def index
    @aboutus = AboutU.all
  end

  def new
    @aboutus = AboutU.new
  end

  def create
    @aboutus = AboutU.new(aboutus_params)

    respond_to do |format|
      if @aboutus.save
        format.html { redirect_to request.referer, notice: 'Aboutus was successfully created.' }
        format.json { render :show, status: :created, location: @aboutus }
      else
        format.html { render :new }
        format.json { render json: @aboutus.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def edit
    @aboutus = AboutU.find(params[:id])
  end

  def about_update
    @aboutus = AboutU.find(params[:id])
    respond_to do |format|
      if @aboutus.update(aboutus_params)
        format.html { redirect_to request.referer, notice: 'Aboutus was successfully updated.' }
        format.json { render :show, status: :ok, location: @aboutus }
      else
        format.html { render :edit }
        format.json { render json: @aboutus.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @aboutus = AboutU.find(params[:id])
    respond_to do |format|
      if @aboutus.update(aboutus_params)
        format.html { redirect_to request.referer, notice: 'Aboutus was successfully updated.' }
        format.json { render :show, status: :ok, location: @aboutus }
      else
        format.html { render :edit }
        format.json { render json: @aboutus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aboutus = AboutU.find(params[:id])
    @aboutus.destroy
    respond_to do |format|
      format.html { redirect_to admin_abouts_url, notice: 'Aboutus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aboutus
      @aboutus = AboutU.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aboutus_params
      params.require(:about_u).permit(:context, :about_us_image, :about_us_video)
    end
end
