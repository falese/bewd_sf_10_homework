class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end
  def show
    @artist = Artist.find(params[:id])
  end
  def new
  end
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render 'new'
    end
  end

  def edit

  end

  def update
  end
  def destroy
  end
private
  def artist_params
    params.require(:name).permit(:description, :image_url)
  end

end
