class CreateVerse < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :name
			t.integer :songinfo_id
    end
  end
end
