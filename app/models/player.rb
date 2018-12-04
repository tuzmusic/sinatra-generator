class Player < ActiveRecord::Base
  has_many :song_players
  has_many :songs, through: :song_players
end