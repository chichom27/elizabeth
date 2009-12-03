class Comment < ActiveRecord::Base
  
  belongs_to :pictures
  belongs_to :event
  
  acts_as_authorization_object
  validates_presence_of     :name
  validates_length_of       :name,    :within => 1..40
  validates_presence_of     :comment
  validates_length_of       :comment,    :within => 1..250
  
end
