class VerseController < ApplicationController

  # Index Action
  get '/verses' do
    @verses = Verse.all
    erb :'/verses/index'
  end
  
  # New Action
  get '/verses/new' do
    @song_infos = SongInfo.all
    @lyrics = Lyric.all
    erb :'/verses/new'
  end
  
  # Create Action
  post '/verses' do
    verse = Verse.create(params['verse'])
    verse.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    verse.lyrics << Lyric.create(name: params['lyric_name']) unless params['lyric_name'].empty?
    verse.save
    redirect "verses/#{verse.id}"
  end
  
  # Show Action
  get '/verses/:id' do
    @verse = Verse.find(params[:id])
    erb :'/verses/show'
  end
  
  # Edit Action
  get '/verses/:id/edit' do
    @verse = Verse.find(params[:id])
    @song_infos = SongInfo.all
    @lyrics = Lyric.all
    erb :'/verses/edit'
  end
  
  # Patch Action
  patch '/verses/:id' do
    params[:song_info]['lyric_ids'].clear if !params[:verse].keys.include?('lyric_ids')
    verse = Verse.find(params[:id])
    verse.update(params['verse'])
    verse.song_info = SongInfo.create(name: params['song_info_name']) unless params['song_info_name'].empty?
    verse.lyrics << Lyric.create(name: params['lyric_name']) unless params['lyric_name'].empty?
    verse.save
    redirect "verses/#{verse.id}"
  end
  
  # Delete Action
  delete '/verses/:id' do
    verse = Verse.find(params[:id])
    verse.delete
  end
  
end