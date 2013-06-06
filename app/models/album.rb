class Album < ActiveRecord::Base
  attr_accessible :name, :year, :band

  validates :name, :presence => true,
  								 :uniqueness => { :scope => :band_id }

  belongs_to :band
  has_many :tracks

end
