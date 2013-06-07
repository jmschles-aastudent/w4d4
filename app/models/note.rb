class Note < ActiveRecord::Base
  attr_accessible :text, :track, :track_id, :author, :author_id

  validates :track_id, :presence => true
  validates :text, :presence => true,
  								 :length => { :maximum => 140 }

  validates :author_id, :presence => true

  belongs_to :track
  belongs_to :author, :class_name => User
end
