class AddBandToArtist < ActiveRecord::Migration
  def change
  	add_column :artist, :band_id, :integer
  end
end
