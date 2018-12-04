class CreateSongInfoPlayer < ActiveRecord::Migration
  def change
    create_table :song_info_players do |t|
      t.integer :songinfo_id
    end
  end
end
