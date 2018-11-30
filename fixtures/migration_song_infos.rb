class CreateSongInfo < ActiveRecord::Migration
  def change
    create_table :song_infos do |t|
      t.string :name
      t.string :artist_name
      t.integer :duration_in_seconds
      t.integer :artist_id
    end
  end
end
