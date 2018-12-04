class SongInfoGenre < ActiveRecord::Base
  belongs_to :song_info
  belongs_to :genre
end