class Recording < ActiveRecord::Base

	attr_accessible :song_id, :band_id

	belongs_to :band
	belongs_to :song

end