class ArtistsController < ApplicationController

  def index
    # get all artists to display
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @artist_name = "#{@artist.first_name} #{@artist.last_name}"
    @artist.band.nil? ? @artist_band = "No One" : @artist_band = @artist.band
  end

  def new
    @artist = Artist.new
  end

  def create
    artist_alias = params[:alias] unless params[:alias].blank?
    @artist = Artist.new(
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :alias => artist_alias )
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    params[:alias].blank? ? artist_alias = nil : artist_alias = params[:alias]
    @artist.first_name = params[:first_name]
    @artist.last_name = params[:last_name]
    @artist.alias = artist_alias

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

end
