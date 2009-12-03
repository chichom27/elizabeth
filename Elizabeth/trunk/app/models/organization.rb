class Organization < ActiveRecord::Base
  has_many :locations
  belongs_to :category
  has_many :events
  belongs_to :album
  belongs_to :user
  
  acts_as_authorization_object
end
