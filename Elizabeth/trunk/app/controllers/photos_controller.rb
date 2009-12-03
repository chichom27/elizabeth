class PhotosController < ApplicationController
  layout 'standard'
  # GET /albums/1
  # GET /albums/1.xml
  def show
    @photo = Photo.find(params[:id])
    @album = Album.find_by_id(@photo.album_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

end