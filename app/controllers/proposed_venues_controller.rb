class ProposedVenuesController < ApplicationController
  # GET /proposed_venues
  # GET /proposed_venues.xml
  def index
    @proposed_venues = ProposedVenue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposed_venues }
    end
  end

  # GET /proposed_venues/1
  # GET /proposed_venues/1.xml
  def show
    @proposed_venue = ProposedVenue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proposed_venue }
    end
  end

  # GET /proposed_venues/new
  # GET /proposed_venues/new.xml
  def new
    @proposed_venue = ProposedVenue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposed_venue }
    end
  end

  # GET /proposed_venues/1/edit
  def edit
    @proposed_venue = ProposedVenue.find(params[:id])
  end

  # POST /proposed_venues
  # POST /proposed_venues.xml
  def create
    @proposed_venue = ProposedVenue.new(params[:proposed_venue])

    respond_to do |format|
      if @proposed_venue.save
        format.html { redirect_to(@proposed_venue, :notice => 'Proposed venue was successfully created.') }
        format.xml  { render :xml => @proposed_venue, :status => :created, :location => @proposed_venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proposed_venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proposed_venues/1
  # PUT /proposed_venues/1.xml
  def update
    @proposed_venue = ProposedVenue.find(params[:id])

    respond_to do |format|
      if @proposed_venue.update_attributes(params[:proposed_venue])
        format.html { redirect_to(@proposed_venue, :notice => 'Proposed venue was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proposed_venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_venues/1
  # DELETE /proposed_venues/1.xml
  def destroy
    @proposed_venue = ProposedVenue.find(params[:id])
    @proposed_venue.destroy

    respond_to do |format|
      format.html { redirect_to(proposed_venues_url) }
      format.xml  { head :ok }
    end
  end
end