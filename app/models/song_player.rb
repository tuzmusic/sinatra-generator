class SongPlayer < ActiveRecord::Base
  belongs_to :song
  belongs_to :player
end