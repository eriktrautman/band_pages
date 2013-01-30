class Artist < ActiveRecord::Base

	attr_accessible :name, :band_id

	belongs_to :band
	has_many :authored_songs, :foreign_key => :author_id, :class_name => "Song"
	has_many :recordings, :through => :band
	has_many :performed_songs, :through => :recordings, :source => :song

	# returns a hash containing, for each artist, an array of his songs
	def self.recorded_songs
		artists = self.includes(:authored_songs)
		authored_songs = {}
		artists.each do |artist|
			authored_songs[artist] = artist.authored_songs
		end
		authored_songs
	end

end