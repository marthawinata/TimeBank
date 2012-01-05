class MeetupsController < ApplicationController
  # GET /meetups
  # GET /meetups.xml
  def index
    @meetups = Meetup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetups }
    end
  end

  # GET /meetups/1
  # GET /meetups/1.xml
  def show
    @meetup = Meetup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meetup }
    end
  end

  # GET /meetups/new
  # GET /meetups/new.xml
  def new
    @meetup = Meetup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meetup }
    end
  end

  # GET /meetups/1/edit
  def edit
    @meetup = Meetup.find(params[:id])
  end

  # POST /meetups
  # POST /meetups.xml
  def create
    @meetup = Meetup.new(params[:meetup])

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
