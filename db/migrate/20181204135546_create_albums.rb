class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
			t.integer :songinfo_id
    end
  end
end
