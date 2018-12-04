class Artist < ActiveRecord::Base
  has_many :song_infos
  has_many :genres, though: :songs
end