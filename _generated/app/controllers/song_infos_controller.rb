class SongInfoController < ApplicationController

  # Index Action
["get '/song_infos' do", "@song_infos = SongInfo.all", "erb :'/song_infos/index'", "end"]

  # New Action
  get '/song_infos/new' do
    @artists = Artist.all
    @albums = Album.all
    @genres = Genre.all
    @players = Player.all
    @verses = Verse.all
    @chorus = Chorus.all
    erb :'/song_infos/new'
  end

  # Create Action
  post '/song_infos' do 
    song_info = SongInfo.create(params['song_info'])
    song_info.artist = Artist.create(name: params['artist_name']) unless params['artist_name'].empty?
song_info.album = Album.create(name: params['album_name']) unless params['album_name'].empty?
    song_info.verses << Verse.create(name: params['verse_name']) unless params['verse_name'].empty?
song_info.chorus << Chorus.create(name: params['chorus_name']) unless params['chorus_name'].empty?
song_info.genres << Genre.create(name: params['genre_name']) unless params['genre_name'].empty?
song_info.players << Player.create(name: params['player_name']) unless params['player_name'].empty?
    song_info.save
    redirect "song_infos/#{song_info.id}"
  end

  # Show Action
  get '/song_infos/:id' do 
    @song_info = SongInfo.find(params[:id])
    erb :'/song_infos/show'
  end

  # Edit Action
  get '/song_infos/:id/edit' do
    @song_info = SongInfo.find(params[:id])
    @artists = Artist.all
@albums = Album.all
@genres = Genre.all
@players = Player.all
@verses = Verse.all
@chorus = Chorus.all
    erb :'/song_infos/edit'
  end

  # Patch Action
patch '/song_infos/:id' do 
      params[:song_info]['verse_ids'].clear if !params[:song_info].keys.include?('verse_ids')
params[:song_info]['chorus_ids'].clear if !params[:song_info].keys.include?('chorus_ids')
params[:song_info]['genre_ids'].clear if !params[:song_info].keys.include?('genre_ids')
params[:song_info]['player_ids'].clear if !params[:song_info].keys.include?('player_ids')
      song_info = SongInfo.find(params[:id])
      song_info.update(params['song_info'])
      song_info.artist = Artist.create(name: params['artist_name']) unless params['artist_name'].empty?
song_info.album = Album.create(name: params['album_name']) unless params['album_name'].empty?
      song_info.verses << Verse.create(name: params['verse_name']) unless params['verse_name'].empty?
song_info.chorus << Chorus.create(name: params['chorus_name']) unless params['chorus_name'].empty?
song_info.genres << Genre.create(name: params['genre_name']) unless params['genre_name'].empty?
song_info.players << Player.create(name: params['player_name']) unless params['player_name'].empty?
      song_info.save
      redirect "song_infos/#{song_info.id}"
    end

  # Delete Action
delete '/song_infos/:id' do
      song_info = SongInfo.find(params[:id])
      song_info.delete
    end


end