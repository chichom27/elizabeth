class Event < ActiveRecord::Base
  has_event_calendar

  belongs_to :category
  belongs_to :location
  belongs_to :organization, :foreign_key => "org_id"
  belongs_to :album
  has_many :comments
  acts_as_authorization_object
  
end

