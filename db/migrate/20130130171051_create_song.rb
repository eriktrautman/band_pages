class CreateSong < ActiveRecord::Migration
  def up
  	create_table :song do |t|
  		t.string :name
  		t.integer :author_id

  		t.timestamps
  	end
  end

  def down
  	drop_table :song
  end
end
