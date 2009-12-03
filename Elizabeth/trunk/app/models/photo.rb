class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :data,
  :styles => {
    :thumb => "128x96#",
    :large => "640x480#"
  } 
  
  validates_attachment_presence :data
  validates_attachment_content_type :data,
  :content_type => [ 'image/jpeg', 'image/pjpeg','image/jpg', 'image/png']
  
  #Add class method in Photo model
  def self.destroy_pics(album, photos)
    Photo.find(photos, :conditions => {:album_id => album}).each(&:destroy)
  end
  
  def self.search(search, page)
    paginate :per_page => 16, :page => page,
                            :conditions => ['album_id like ?', "#{search}"],
                            :order => 'id'  
  end
end
