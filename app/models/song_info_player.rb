class SongInfoPlayer < ActiveRecord::Base
  belongs_to :song_info
  belongs_to :player
end