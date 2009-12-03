class Category < ActiveRecord::Base
  
  has_many :organizations
  has_many :events
  
end
