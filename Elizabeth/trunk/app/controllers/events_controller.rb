class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  before_filter :load_event, :only => [:edit, :update, :destroy, :show]

     layout 'event_layout'
     include AuthenticatedSystem

  access_control do
     allow :admin
     allow :org, :to => [:create, :new]
     allow all, :to => [:index, :show]
     allow :owner, :of => :event, :to => :edit
  end
  
  

  
  def index
    if !(params[:id] == nil)
      @events = Event.find(:all, :conditions =>  ["org_id = ?", params[:id]], :order => "created_at")
    else
      #if logged_in?
      #  @owner = current_user.has_role? ('owner', event)
      #end
      @events = Event.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = Comment.find(:all, :conditions =>  ["event_id = ?", @event.id], :order => "created_at")
    @album = Album.find_by_id(@event.album_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    @album = Album.new
    @album.name = @event.name
    @album.save
    @event.album_id = @album.id

    respond_to do |format|
      if @event.save
        current_user.has_role!('owner', @event)
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private 
  def load_event
    @event = Event.find(params[:id])
   end
end
