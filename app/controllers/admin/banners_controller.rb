class Admin::BannersController < ApplicationController
	before_action :set_banner, only: [:show, :edit, :update, :destroy]
	layout "admin"

	def index
		@banners = Banner.all.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@banner = Banner.new
		@categories = Category.all
	end

	def create
		@banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_path, notice: 'Banner was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to admin_banners_url, notice: 'Banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_banners_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:title, :banner, :category_id)
    end
end
