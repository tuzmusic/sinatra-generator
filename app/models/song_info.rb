class SongInfo < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_info_genres
  has_many :song_info_genres
  has_many :players, through: :song_info_players
  has_many :song_info_players
  has_many :verses
  has_many :chorus
end