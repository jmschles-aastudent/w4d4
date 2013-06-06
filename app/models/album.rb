class Album < ActiveRecord::Base
	attr_accessible :name, :year, :band, :recording_type, :band_id

	before_validation :set_recording_type_default

  validates :name, :presence => true,
  								 :uniqueness => { :scope => :band_id }

  validates :band_id, :presence => true

  validates :recording_type, :inclusion => { :in => %w(studio live) }

  belongs_to :band
  has_many :tracks, :dependent => :destroy

  def set_recording_type_default
  	self.recording_type ||= "studio"
  	true
  end

end
