class Band < ActiveRecord::Base

	attr_accessible :name, :photo
	validates :name, :presence => true, :uniqueness => true

	has_many :artists
	has_many :recordings
	has_many :songs, :through => :recordings

	# finds bands who have recorded the same song > 1 time
	def self.repeat_recorders
		self
			.select("bands.*, COUNT(DISTINCT(recordings.song_id)) AS song_count, songs.name AS song_name")
			.joins(:songs)
			.group("bands.id")
			.having("COUNT(DISTINCT(recordings.song_id)) < COUNT(recordings.song_id)")
	end

	def num_distinct_recordings
		self.songs.uniq.count
	end

end