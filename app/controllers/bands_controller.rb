class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(:name => params[:name])
    if @band.save
      redirect_to @band
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end



end
