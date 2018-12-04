class CreateLyric < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :name
			t.integer :verse_id
    end
  end
end
