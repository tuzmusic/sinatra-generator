class SongInfosControllerMock 

  def all_properties
    ['@artists = Artist.all',
      '@albums = Album.all',
      '@genres = Genre.all',
      '@players = Player.all']
  end

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
      song_info.artist = Artist.create(name: params['artist']['name']) unless params['artist']['name'].empty?
      song_info.album = Album.create(name: params['album']['name']) unless params['album']['name'].empty?
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

  def edit_action
    %(get '/song_infos/:id/edit' do 
      @song_info = SongInfo.find(params[:id])
      @artists = Artist.all
      @albums = Album.all
      @genres = Genre.all
      @players = Player.all
      erb :'/song_infos/edit'
    end)
  end

  def patch_action
    %(patch '/song_infos/:id' do 
      if !params[:song_info].keys.include?('genre_ids')
        params[:song_info]['genre_ids'] = []
      end 
      if !params[:song_info].keys.include?('player_ids')
        params[:song_info]['player_ids'] = []
      end 
      song_info = song_info.find(params[:id])
      song_info.update(params['song_info'])
      song_info.artist = Artist.create(name: params['artist']['name']) unless params['artist']['name'].empty?
      song_info.album = Album.create(name: params['album']['name']) unless params['album']['name'].empty?
      song_info.genres << Genre.create(name: params['genre']['name']) unless params['genre']['name'].empty?
      song_info.players << Player.create(name: params['player']['name']) unless params['player']['name'].empty?
      song_info.save
      redirect "song_infos/\#{song_info.id}"
      end
    end)    
  end

  def delete_action
    %(delete '/song_infos/:id' do
      song_info = SongInfo.find(params[:id])
      song_info.delete
    end)
  end

end