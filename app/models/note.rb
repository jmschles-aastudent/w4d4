class Note < ActiveRecord::Base
  attr_accessible :text, :track, :track_id

  validates :track_id, :presence => true
  validates :text, :presence => true,
  								 :length => { :maximum => 140 }

  belongs_to :track
end
