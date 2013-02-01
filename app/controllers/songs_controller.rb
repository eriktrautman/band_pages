class SongsController < ApplicationController

  def new

  end

  def create

  end

  def show
    @song = Song.find(params[:id])
  end

  def edit

  end

end
