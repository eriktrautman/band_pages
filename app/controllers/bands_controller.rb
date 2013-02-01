class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
     photo_blob = params[:band].delete(:photo).read
     @band = Band.new(params[:band])
     @band.photo = photo_blob

    if @band.save
      redirect_to @band, :notice => "Congratulations on forming your band!"
    else
      flash[:error] = @band.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    photo_blob = params[:band].delete(:photo).read
    @band = Band.find(params[:id])
    @band.update_attributes(params[:band])
    @band.photo = photo_blob

    if @band.save
      redirect_to @band, :notice => "You've successfully updated your band info"
    else
      flash[:error] = @band.errors.full_messages.to_sentence
      render :edit
    end
  end

  def photo
    @band = Band.find(params[:id])
    send_data @band.photo, :type => 'image/jpg'
  end

end
