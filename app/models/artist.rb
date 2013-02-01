class Artist < ActiveRecord::Base
	[	:first_name,
		:last_name,
		:alias,
		:band_id	].each { |field| attr_accessible field }

	[	:first_name,
		:last_name ].each { |field| validates field, :presence => true }

	[ :first_name,
		:last_name ].each { |field| validates field, :length => (3..15) }

	before_validation :nil_if_blank

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

	def nil_if_blank
		self.alias = nil if self.alias.blank?
		true
	end

end