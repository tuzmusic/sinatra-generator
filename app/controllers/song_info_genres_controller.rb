class SongInfoGenreController < ApplicationController

  # Index Action
  get '/song_info_genres' do
    @song_info_genres = SongInfoGenre.all
    erb :'/song_info_genres/index'
  end
  
  # New Action
  get '/song_info_genres/new' do
    @song_infos = SongInfo.all
    erb :'/song_info_genres/new'
  end
  
  # Create Action
  post '/song_info_genres' do
    song_info_genre = SongInfoGenre.create(params['song_info_genre'])
    song_info_genre.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?

    song_info_genre.save
    redirect "song_info_genres/#{song_info_genre.id}"
  end
  
  # Show Action
  get '/song_info_genres/:id' do
    @song_info_genre = SongInfoGenre.find(params[:id])
    erb :'/song_info_genres/show'
  end
  
  # Edit Action
  get '/song_info_genres/:id/edit' do
    @song_info_genre = SongInfoGenre.find(params[:id])
    @song_infos = SongInfo.all
    erb :'/song_info_genres/edit'
  end
  
  # Patch Action
  patch '/song_info_genres/:id' do

    song_info_genre = SongInfoGenre.find(params[:id])
    song_info_genre.update(params['song_info_genre'])
    song_info_genre.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?

    song_info_genre.save
    redirect "song_info_genres/#{song_info_genre.id}"
  end
  
  # Delete Action
  delete '/song_info_genres/:id' do
    song_info_genre = SongInfoGenre.find(params[:id])
    song_info_genre.delete
  end
  
end