class Player < ActiveRecord::Base
  has_many :song_info_players
  has_many :song_infos, through: :song_info_players
end