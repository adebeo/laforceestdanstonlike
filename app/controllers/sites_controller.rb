class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]


  def main
    @site = Site.new
    @sites = Site.all
    randomsite = Site.order("RANDOM()").limit(1).first
    if  @randomsite
      @next_url = @randomsite.url
    else
      @next_url = "rien trouve"
    end
    #render :main , :layout => false 
  end

  def get_next
    randomsite = Site.order("RANDOM()").limit(1).first
    @next_url = @randomsite.url
    render json: {"next_url": @next_url}
  end

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
    respond_to do |format|
        format.html { render  :main }
        format.json { render  json: @sites.to_json }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:url])
    @site.save
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:url)
    end
end
