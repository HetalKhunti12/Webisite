class Admin::HowItWorksController < ApplicationController
  before_action :authenticate_contact!
  before_action :set_how_works, only: [:show, :edit, :update, :destroy]
  layout "admin"

  def index
    @how_it_works = HowItWork.all
  end

  def new
    @how_it_work = HowItWork.new
  end

  def create
    @how_it_work = HowItWork.new(how_work_params)

    respond_to do |format|
      if @how_it_work.save
        format.html { redirect_to request.referer, notice: 'How It Works was successfully created.' }
        format.json { render :show, status: :created, location: @how_it_work }
      else
        format.html { render :new }
        format.json { render json: @how_it_work.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def edit
    @how_it_work = HowItWork.find(params[:id])
  end

  def update
    @how_it_work = HowItWork.find(params[:id])
    respond_to do |format|
      if @how_it_work.update(how_work_params)
        format.html { redirect_to request.referer, notice: 'How It Works was successfully updated.' }
        format.json { render :show, status: :ok, location: @how_it_work }
      else
        format.html { render :edit }
        format.json { render json: @how_it_work.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @how_it_work = HowItWork.find(params[:id])
    @how_it_work.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'How It Works was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how_works
      @how_it_work = HowItWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def how_work_params
      params.require(:how_it_work).permit(:context, :how_it_works_image, :how_it_works_video)
    end
end
