class Track < ActiveRecord::Base
  attr_accessible :ord, :title, :album

  validates :ord, :presence => true,
  								:uniqueness => { :scope => :album_id },
  								:within => { 1..self.album.tracks.count }

 	validates :title, :presence => true,
 										:uniqueness => { :scope => :album_id }

 	validates :album, :presence => true


  belongs_to :album
end
