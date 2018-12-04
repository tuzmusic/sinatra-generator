class GenreController < ApplicationController

  # Index Action
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end
  
  # New Action
  get '/genres/new' do
    @song_infos = SongInfo.all
    erb :'/genres/new'
  end
  
  # Create Action
  post '/genres' do
    genre = Genre.create(params['genre'])

    genre.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    genre.save
    redirect "genres/#{genre.id}"
  end
  
  # Show Action
  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :'/genres/show'
  end
  
  # Edit Action
  get '/genres/:id/edit' do
    @genre = Genre.find(params[:id])
    @song_infos = SongInfo.all
    erb :'/genres/edit'
  end
  
  # Patch Action
  patch '/genres/:id' do
    params[:song_info]['song_info_ids'].clear if !params[:genre].keys.include?('song_info_ids')
    genre = Genre.find(params[:id])
    genre.update(params['genre'])

    genre.song_infos << SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    genre.save
    redirect "genres/#{genre.id}"
  end
  
  # Delete Action
  delete '/genres/:id' do
    genre = Genre.find(params[:id])
    genre.delete
  end
  
end