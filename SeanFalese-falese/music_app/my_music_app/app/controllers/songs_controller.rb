class SongsController < ApplicationController

  def index
    @song = Song.new
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def new
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to artist_path(@artist)

  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song
    if @song.update(song_params)
      redirect_to songs_path
    else
      render 'edit'
    end
  end

  def destroy
  end


private
  def song_params
    params.require(:song).permit(:title, :length, :genre)
  end
  def get_song
    Song.find(params[:id])
  end

end
