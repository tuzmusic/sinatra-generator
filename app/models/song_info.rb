class SongInfo < ActiveRecord::Base

  attr_accessor :name, :artist_name, :duration

  belongs_to :artist
  has_many :genres, through: :song_info_genres
  has_many :song_info_genres
  has_many :players, through: :song_info_players
  has_many :song_info_players
  has_many :verses
  has_many :lyrics, through: :verses  # for testing many_through. not otherwise implemented
end