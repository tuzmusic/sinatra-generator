class SongInfosControllerMock 
  def index_action
    %(get '/song_infos' do
      @song_infos = SongInfo.all
      erb :'/song_infos/index'
    end)
  end

  def new_action
    %(get '/song_infos/new' do
        @artists = Artist.all
        @albums = Album.all
        @genres = Genre.all
        @players = Player.all
        erb :'/song_infos/new'
      end)
  end

end