class Track < ActiveRecord::Base
  attr_accessible :ord, :title, :album

  before_create :set_bonus_to_false

  validates :ord, :presence => true,
  								:uniqueness => { :scope => :album_id }
  								# :within => 1..self.album.tracks.count

 	validates :title, :presence => true,
 										:uniqueness => { :scope => :album_id }

 	validates :album_id, :presence => true

 	validates :bonus, :presence => true

  belongs_to :album

  def set_bonus_to_false
  	self.bonus = false
  end
end
