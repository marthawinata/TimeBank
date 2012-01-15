class MeetupsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /meetups
  # GET /meetups.xml
  def index
    @meetups = current_user.meetups
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetups }
    end
  end

  def join
    meetup = Meetup.where(:id => params[:id]).first
    if meetup.can_join?(current_user)
      meetup.users.push(current_user) unless meetup.users.include?(current_user)
      meetup.invitations.where(:email => current_user.email).each {|invite| invite.expire}
      meetup.save
      redirect_to(meetup, :notice => "User #{current_user.email} has successfully joined #{meetup.name}")
    else
      redirect_to(meetup, :notice => "User does not have permission to join #{meetup.name}")
    end
  end

  # GET /meetups/1
  # GET /meetups/1.xml
  def show
    @meetup = Meetup.find(params[:id])
    @host_user = current_user
    @proposed_timings = @meetup.proposed_timings
    @available_boardgames = @meetup.available_boardgames
    @proposed_venues = @meetup.proposed_venues
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meetup }
    end
  end

  # GET /meetups/new
  # GET /meetups/new.xml
  def new
    @meetup = Meetup.new
    @host_user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meetup }
    end
  end

  # GET /meetups/1/edit
  def edit
    @meetup = Meetup.find(params[:id])
    @host_user = current_user
  end

  # POST /meetups
  # POST /meetups.xml
  def create
    @meetup = Meetup.new(params[:meetup])
    @meetup.host_user = current_user
    @meetup.users.push(current_user)
    respond_to do |format|
      if @meetup.save
        format.html { redirect_to(@meetup, :notice => 'Meetup was successfully created.') }
        format.xml  { render :xml => @meetup, :status => :created, :location => @meetup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meetup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetups/1
  # PUT /meetups/1.xml
  def update
    @meetup = Meetup.find(params[:id])

    respond_to do |format|
      if @meetup.update_attributes(params[:meetup])
        format.html { redirect_to(@meetup, :notice => 'Meetup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meetup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetups/1
  # DELETE /meetups/1.xml
  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy

    respond_to do |format|
      format.html { redirect_to(meetups_url) }
      format.xml  { head :ok }
    end
  end
end
