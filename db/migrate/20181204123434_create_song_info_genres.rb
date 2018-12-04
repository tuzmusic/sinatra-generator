class CreateSongInfoGenre < ActiveRecord::Migration
  def change
    create_table :song_info_genres do |t|
      t.integer :songinfo_id
    end
  end
end
