class Genre < ActiveRecord::Base
  has_many :song_infos, through: :song_info_genres
  has_many :song_info_genres
end