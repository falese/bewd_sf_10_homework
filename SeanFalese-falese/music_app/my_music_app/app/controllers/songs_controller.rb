class SongsController < ApplicationController

  def index
    @artist = Artist.new
    @songs = @artist.songs.all
  end

  def show
    @song = get_song
  end

  def new
    @artist = Artist.new
    @song = @artist.songs.build
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
    params.require(:song).permit(:title, :length, :genre, :artist_id)
  end

  def get_song
    Song.find(params[:id])
  end

end
