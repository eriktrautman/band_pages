class RenameArtist < ActiveRecord::Migration
	def change
		rename_table :artist, :artists
		rename_table :band, :bands
		rename_table :song, :songs
		rename_table :recording, :recordings
	end	
end
