class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :mdt
  validates_presence_of :latitude, :longitude, :mdt
end
