class Recording < ActiveRecord::Base

	attr_accessible :song_id, :band_id
  validates :song_id, :presence => true
  validates :band_id, :presence => true

	belongs_to :band
	belongs_to :song

end