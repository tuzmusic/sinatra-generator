class Album < ActiveRecord::Base
  has_many :song_infos
  belongs_to :song
end