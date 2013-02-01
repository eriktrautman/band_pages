class Song < ActiveRecord::Base

	attr_accessible :name, :author_id
  validates :name, :presence => true
  validates :author_id, :presence => true

	belongs_to :artist, :foreign_key => :author_id
	has_many :recordings
	has_many :bands, :through => :recordings
	has_many :performing_artists, :through => :bands, :source => :artists


end