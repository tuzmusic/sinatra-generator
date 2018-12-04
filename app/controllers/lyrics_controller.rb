class LyricController < ApplicationController

  # Index Action
  get '/lyrics' do
    @lyrics = Lyric.all
    erb :'/lyrics/index'
  end
  
  # New Action
  get '/lyrics/new' do
    @verses = Verse.all
    erb :'/lyrics/new'
  end
  
  # Create Action
  post '/lyrics' do
    lyric = Lyric.create(params['lyric'])
    lyric.verse = Verse.create(name: params['verse_name']) unless params['verse_name'].empty?

    lyric.save
    redirect "lyrics/#{lyric.id}"
  end
  
  # Show Action
  get '/lyrics/:id' do
    @lyric = Lyric.find(params[:id])
    erb :'/lyrics/show'
  end
  
  # Edit Action
  get '/lyrics/:id/edit' do
    @lyric = Lyric.find(params[:id])
    @verses = Verse.all
    erb :'/lyrics/edit'
  end
  
  # Patch Action
  patch '/lyrics/:id' do

    lyric = Lyric.find(params[:id])
    lyric.update(params['lyric'])
    lyric.verse = Verse.create(name: params['verse_name']) unless params['verse_name'].empty?

    lyric.save
    redirect "lyrics/#{lyric.id}"
  end
  
  # Delete Action
  delete '/lyrics/:id' do
    lyric = Lyric.find(params[:id])
    lyric.delete
  end
  
end