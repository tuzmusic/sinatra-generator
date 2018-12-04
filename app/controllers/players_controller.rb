class PlayerController < ApplicationController

  # Index Action
  get '/players' do
    @players = Player.all
    erb :'/players/index'
  end
  
  # New Action
  get '/players/new' do
    @song_infos = SongInfo.all
    erb :'/players/new'
  end
  
  # Create Action
  post '/players' do
    player = Player.create(params['player'])

    player.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    player.save
    redirect "players/#{player.id}"
  end
  
  # Show Action
  get '/players/:id' do
    @player = Player.find(params[:id])
    erb :'/players/show'
  end
  
  # Edit Action
  get '/players/:id/edit' do
    @player = Player.find(params[:id])
    @song_infos = SongInfo.all
    erb :'/players/edit'
  end
  
  # Patch Action
  patch '/players/:id' do
    params[:song_info]['song_info_ids'].clear if !params[:player].keys.include?('song_info_ids')
    player = Player.find(params[:id])
    player.update(params['player'])

    player.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    player.save
    redirect "players/#{player.id}"
  end
  
  # Delete Action
  delete '/players/:id' do
    player = Player.find(params[:id])
    player.delete
  end
  
end