class CreateRecording < ActiveRecord::Migration
  def up
  	create_table :recording do |t|
  		t.integer :song_id
  		t.integer :band_id

  		t.timestamps
  	end
  end

  def down
  	drop_table :recording
  end
end
