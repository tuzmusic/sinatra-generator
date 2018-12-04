class Genre < ActiveRecord::Base
  has_many :song_infos, through: :song_info_genres
  has_many :artists, through: :song_infos
  has_many :song_info_genres
end