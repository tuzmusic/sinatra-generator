class SongInfosControllerMock 
  def index_action
    %(get '/song_infos' do
      @song_infos = SongInfo.all
      erb :'/song_infos/index' 
    end)
  end

end