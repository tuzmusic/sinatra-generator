class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
  has_many :players, through: :song_players
  has_many :song_players
  has_many :verses
  has_many :chorus
end