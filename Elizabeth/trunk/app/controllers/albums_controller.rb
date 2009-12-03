class AlbumsController < ApplicationController
  layout 'album_layout'
  # GET /albums
  # GET /albums.xml
  
    access_control do
     allow :admin
     #allow :org, :to => [:create, :new, :destroy, :edit]
     allow all, :to => [:index, :show]
     allow :owner, :of => :event, :to => [:create, :new, :destroy, :edit]
  end
  
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])
#    @photos = @album.photos
    
    @photos = Photo.search(params[:id],params[:page])

    @organization = Organization.find(:first, :conditions => ["album_id = ?",params[:id]])
    @event = Event.find(:first, :conditions => ["album_id = ?",params[:id]])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new
    1.upto(3) { @album.photos.build }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  #edit action
  def edit
    @album = Album.find(params[:id])
    if @album.photos.count < 3
      1.upto(3 - @album.photos.count) { @album.photos.build }
    end
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])
    
    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to(@album) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  #update action
  def update
    params[:photo_ids] ||= []
    @album = Album.find(params[:id])
    unless params[:photo_ids].empty?
      Photo.destroy_pics(params[:id], params[:photo_ids])
    end

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to(@album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
  
  def remove
    params[:photo_ids] ||= []
    @album = Album.find(params[:id])
    unless params[:photo_ids].empty?
      Photo.destroy_pics(params[:id], params[:photo_ids])
    end
      
    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Photos were successfully removed.'
        format.html { redirect_to(@album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end
end
