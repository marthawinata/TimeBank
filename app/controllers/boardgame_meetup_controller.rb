class BoardgameMeetupController < ApplicationController
  # GET /available_boardgames
  # GET /available_boardgames.xml
  def index
    @boardgames_meetups = AvailableBoardgame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boardgames_meetups }
    end
  end

  # GET /available_boardgames/1
  # GET /available_boardgames/1.xml
  def show
    @boardgames_meetups = AvailableBoardgame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boardgames_meetups }
    end
  end

  # GET /available_boardgames/new
  # GET /available_boardgames/new.xml
  def new
    @boardgames_meetups = AvailableBoardgame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boardgames_meetups }
    end
  end

  # GET /available_boardgames/1/edit
  def edit
    @boardgames_meetups = AvailableBoardgame.find(params[:id])
  end

  # POST /available_boardgames
  # POST /available_boardgames.xml
  def create
    @boardgames_meetups = AvailableBoardgame.new(params[:available_boardgame])

    respond_to do |format|
      if @boardgames_meetups.save
        format.html { redirect_to(@boardgames_meetups, :notice => 'Available boardgame was successfully created.') }
        format.xml  { render :xml => @boardgames_meetups, :status => :created, :location => @boardgames_meetups }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boardgames_meetups.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /available_boardgames/1
  # PUT /available_boardgames/1.xml
  def update
    @boardgames_meetups = AvailableBoardgame.find(params[:id])

    respond_to do |format|
      if @boardgames_meetups.update_attributes(params[:available_boardgame])
        format.html { redirect_to(@boardgames_meetups, :notice => 'Available boardgame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boardgames_meetups.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /available_boardgames/1
  # DELETE /available_boardgames/1.xml
  def destroy
    @boardgames_meetups = AvailableBoardgame.find(params[:id])
    @boardgames_meetups.destroy

    respond_to do |format|
      format.html { redirect_to(boardgames_meetups_url) }
      format.xml  { head :ok }
    end
  end
end
