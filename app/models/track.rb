class Track < ActiveRecord::Base
  attr_accessible :ord, :title, :album, :bonus, :lyrics, :album_id

  before_create :set_bonus_default

  validates :ord, :presence => true
  								# :uniqueness => { :scope => :album_id }
  								# :within => 1..self.album.tracks.count

 	validates :title, :presence => true
 										# :uniqueness => { :scope => :album_id }

 	validates :album_id, :presence => true
 	
  belongs_to :album
  has_many :notes

  def set_bonus_default
    self.bonus ||= false
    true
  end
end

# def save_track
# 	reload!
# 	album = Album.first
# 	track = Track.new( :title => "cats", :ord => 1, :album => album )
# 	track.save!
# end