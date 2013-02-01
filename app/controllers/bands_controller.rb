class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(params[:band])
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
    @band = Band.find(params[:id])
    @band.update_attributes(params[:band])
    if @band.save
      redirect_to @band, :notice => "You've successfully updated your band info"
    else
      flash[:error] = @band.errors.full_messages.to_sentence
      render :edit
    end
  end


end
