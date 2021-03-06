class SongInfo < ActiveRecord::Base

  attr_accessor :name, :artist_name, :duration_in_seconds

  belongs_to :artist, :album
  has_many :genres, through: :song_info_genres
  has_many :song_info_genres
  has_many :players, through: :song_info_players
  has_many :song_info_players
  has_many :verses
  has_many :lyrics, through: :verses  
  # lyrics for testing many_through. not otherwise implemented
end