class Verse < ActiveRecord::Base
  belongs_to :song_info
  has_many :lyrics
end