class CreateLyric < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.integer :verse_id
    end
  end
end
