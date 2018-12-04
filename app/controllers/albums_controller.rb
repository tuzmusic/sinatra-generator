class AlbumController < ApplicationController

  # Index Action
  get '/albums' do
    @albums = Album.all
    erb :'/albums/index'
  end
  
  # New Action
  get '/albums/new' do
    @song_infos = SongInfo.all
    @song_infos = SongInfo.all
    erb :'/albums/new'
  end
  
  # Create Action
  post '/albums' do
    album = Album.create(params['album'])
    album.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    album.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    album.save
    redirect "albums/#{album.id}"
  end
  
  # Show Action
  get '/albums/:id' do
    @album = Album.find(params[:id])
    erb :'/albums/show'
  end
  
  # Edit Action
  get '/albums/:id/edit' do
    @album = Album.find(params[:id])
    @song_infos = SongInfo.all
    @song_infos = SongInfo.all
    erb :'/albums/edit'
  end
  
  # Patch Action
  patch '/albums/:id' do
    params[:song_info]['song_info_ids'].clear if !params[:album].keys.include?('song_info_ids')
    album = Album.find(params[:id])
    album.update(params['album'])
    album.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    album.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    album.save
    redirect "albums/#{album.id}"
  end
  
  # Delete Action
  delete '/albums/:id' do
    album = Album.find(params[:id])
    album.delete
  end
  
end