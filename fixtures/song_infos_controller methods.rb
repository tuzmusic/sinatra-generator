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

  def create_action
    %(post '/song_infos' do 
      song_info = SongInfo.create(params['song_info'])
      song_info.artists = Artist.create(name: params['artist']['name']) unless params['artist']['name'].empty?
      song_info.albums = Album.create(name: params['album']['name']) unless params['album']['name'].empty?
      song_info.genres << Genre.create(name: params['genre']['name']) unless params['genre']['name'].empty?
      song_info.players << Player.create(name: params['player']['name']) unless params['player']['name'].empty?
      song_info.save
      redirect "song_infos/\#{song_info.id}"
    end)    
  end

  def show_action
    %(get '/song_infos/:id' do 
      @song_info = SongInfo.find(params[:id])
      erb :'/song_infos/show'
    end)
  end

end