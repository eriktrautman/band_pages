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
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to @artist, :notice => "Congratulations on your new Artist page!"
    else
      flash[:error] = @artist.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update_attributes(params[:artist])

    if @artist.save
      redirect_to @artist, :notice => "You've successfully updated your artist information"
    else
      flash[:error] = @artist.errors.full_messages.to_sentence
      render :edit
    end
  end

end
