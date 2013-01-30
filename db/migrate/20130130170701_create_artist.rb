class CreateArtist < ActiveRecord::Migration
  def up
  	create_table :artist do |t|
  		t.string :name

  		t.timestamps
  	end
  end

  def down
  	drop_table :artist
  end
end
