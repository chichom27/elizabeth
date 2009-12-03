class Location < ActiveRecord::Base
  has_many :events
  belongs_to :picture
end
