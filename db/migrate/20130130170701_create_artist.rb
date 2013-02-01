class CreateArtist < ActiveRecord::Migration
  def up
  	create_table :artist do |t|
  		t.string :first_name
      t.string :last_name
      t.string :alias

  		t.timestamps
  	end
  end

  def down
  	drop_table :artist
  end
end
