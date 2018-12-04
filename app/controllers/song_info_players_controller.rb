class SongInfoPlayerController < ApplicationController

  # Index Action
  get '/song_info_players' do
    @song_info_players = SongInfoPlayer.all
    erb :'/song_info_players/index'
  end
  
  # New Action
  get '/song_info_players/new' do
    @song_infos = SongInfo.all
    erb :'/song_info_players/new'
  end
  
  # Create Action
  post '/song_info_players' do
    song_info_player = SongInfoPlayer.create(params['song_info_player'])
    song_info_player.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?

    song_info_player.save
    redirect "song_info_players/#{song_info_player.id}"
  end
  
  # Show Action
  get '/song_info_players/:id' do
    @song_info_player = SongInfoPlayer.find(params[:id])
    erb :'/song_info_players/show'
  end
  
  # Edit Action
  get '/song_info_players/:id/edit' do
    @song_info_player = SongInfoPlayer.find(params[:id])
    @song_infos = SongInfo.all
    erb :'/song_info_players/edit'
  end
  
  # Patch Action
  patch '/song_info_players/:id' do

    song_info_player = SongInfoPlayer.find(params[:id])
    song_info_player.update(params['song_info_player'])
    song_info_player.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?

    song_info_player.save
    redirect "song_info_players/#{song_info_player.id}"
  end
  
  # Delete Action
  delete '/song_info_players/:id' do
    song_info_player = SongInfoPlayer.find(params[:id])
    song_info_player.delete
  end
  
end