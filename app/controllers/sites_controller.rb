class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:main, :create, :checkin_site,:get_next_site]

  def main

    @site = Site.new
    @sites = get_none_checked_site(0,10)

    #render :main , :layout => false 
  end

  def checkin_site
    checkin = Checkin.new({:user_id=>@user.id,:site_id=>params[:id]})
    if checkin.save
      render json: {"status"=>"succes"}
    else
      render json: {"status"=>"fail"}
    end
  end

  def get_next
    randomsite = Site.order("RANDOM()").limit(1).first
    @next_url = @randomsite.url
    render json: {"next_url": @next_url}
  end

  # GET /sites
  # GET /sites.json
  def index
    @sites = get_none_checked_site
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

    @site = Site.new({:url=>params[:url],:pseudo=>params[:pseudo]})
    @site.save

    checkin = Checkin.new({:site_id=>@site.id,:user_id=> @user.id})
    if checkin.save
      render json: {"message"=>"impossible de créer : verifier l'url","id"=>@site.id,"status"=>"ok"}
    else
      render json: {"message"=>"probleme lors de la creation","status"=>"fail"}
    end
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

  def get_next_site
     start = params[:start].to_i
     stop = params[:stop].to_i
     next_site = get_none_checked_site(start,stop)
     render json: {"sites":next_site.to_json}
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def get_none_checked_site(start,stop)
      @checked_site = @user.sites.includes(:checkins)
      @sites = Site.all
      none_checked_site = @sites - @checked_site
      return none_checked_site[start..stop]
    end

    def set_user
      ip = request.remote_ip.to_s

      if User.find_by_ip(ip)

        @user = User.find_by_ip(ip)

      else
        @user = User.new({:ip=>ip})
        @user.save
      end
    end

    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:url,:pseudo)
    end
end
