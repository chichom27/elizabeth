class Album < ActiveRecord::Base
  has_many :photos
  has_one :organization
  has_one :event
  acts_as_authorization_object

  def photo_attributes=(photo_attributes)
    photo_attributes.each do |attributes|
      photos.build(attributes)
    end
  end  
end
