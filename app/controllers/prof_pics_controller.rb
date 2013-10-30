class ProfPicsController < ApplicationController
  before_action :set_prof_pic, only: [:show, :edit, :update, :destroy]

  # GET /prof_pics
  # GET /prof_pics.json
  def index
    @prof_pics = ProfPic.all
  end

  # GET /prof_pics/1
  # GET /prof_pics/1.json
  def show
  end

  # GET /prof_pics/new
  def new
    @prof_pic = ProfPic.new
  end

  # GET /prof_pics/1/edit
  def edit
  end

  # POST /prof_pics
  # POST /prof_pics.json
  def create
    @prof_pic = ProfPic.new(prof_pic_params)

    respond_to do |format|
      if @prof_pic.save
        format.html { redirect_to @prof_pic, notice: 'Prof pic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prof_pic }
      else
        format.html { render action: 'new' }
        format.json { render json: @prof_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prof_pics/1
  # PATCH/PUT /prof_pics/1.json
  def update
    respond_to do |format|
      if @prof_pic.update(prof_pic_params)
        format.html { redirect_to @prof_pic, notice: 'Prof pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prof_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prof_pics/1
  # DELETE /prof_pics/1.json
  def destroy
    @prof_pic.destroy
    respond_to do |format|
      format.html { redirect_to prof_pics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prof_pic
      @prof_pic = ProfPic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prof_pic_params
      params.require(:prof_pic).permit(:name, :description, :picture)
    end
end
