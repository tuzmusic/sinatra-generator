class ArtistController < ApplicationController

  # Index Action
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
  
  # New Action
  get '/artists/new' do
    @song_infos = SongInfo.all
    @genres,though/songs = Genres,Though::Song.all
    erb :'/artists/new'
  end
  
  # Create Action
  post '/artists' do
    artist = Artist.create(params['artist'])

    artist.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    artist.genres,though/songs << Genres,Though::Song.create(name: params['genres,though/song_name']) unless params['genres,though/song_name'].empty?
    artist.save
    redirect "artists/#{artist.id}"
  end
  
  # Show Action
  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :'/artists/show'
  end
  
  # Edit Action
  get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    @song_infos = SongInfo.all
    @genres,though/songs = Genres,Though::Song.all
    erb :'/artists/edit'
  end
  
  # Patch Action
  patch '/artists/:id' do
    params[:song_info]['song_info_ids'].clear if !params[:artist].keys.include?('song_info_ids')
    params[:song_info]['genres,though/song_ids'].clear if !params[:artist].keys.include?('genres,though/song_ids')
    artist = Artist.find(params[:id])
    artist.update(params['artist'])

    artist.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    artist.genres,though/songs << Genres,Though::Song.create(name: params['genres,though/song_name']) unless params['genres,though/song_name'].empty?
    artist.save
    redirect "artists/#{artist.id}"
  end
  
  # Delete Action
  delete '/artists/:id' do
    artist = Artist.find(params[:id])
    artist.delete
  end
  
end