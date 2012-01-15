class AvailableBoardgamesController < ApplicationController
  # GET /available_boardgames
  # GET /available_boardgames.xml
  def index
    @available_boardgames = AvailableBoardgame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @available_boardgames }
    end
  end

  # GET /available_boardgames/1
  # GET /available_boardgames/1.xml
  def show
    @available_boardgame = AvailableBoardgame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @available_boardgames }
    end
  end

  # GET /available_boardgames/new
  # GET /available_boardgames/new.xml
  def new
    @available_boardgame = AvailableBoardgame.new(:meetup_id => params[:meetup_id])
    @boardgames = Boardgame.order("name ASC").all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @available_boardgames }
    end
  end

  # GET /available_boardgames/1/edit
  def edit
    @available_boardgames = AvailableBoardgame.find(params[:id])
    @boardgames = Boardgame.all
    
  end

  # POST /available_boardgames
  # POST /available_boardgames.xml
  def create
    @available_boardgames = AvailableBoardgame.new(params[:available_boardgame])
    @available_boardgames.user = current_user
    respond_to do |format|
      if @available_boardgames.save
        format.html { redirect_to(@available_boardgames.meetup, :notice => 'Available boardgame was successfully created.') }
        format.xml  { render :xml => @available_boardgames.meetup, :status => :created, :location => @available_boardgames }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @available_boardgames.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /available_boardgames/1
  # PUT /available_boardgames/1.xml
  def update
    @available_boardgames = AvailableBoardgame.find(params[:id])

    respond_to do |format|
      if @available_boardgames.update_attributes(params[:available_boardgame])
        format.html { redirect_to(@available_boardgames, :notice => 'Available boardgame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @available_boardgames.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /available_boardgames/1
  # DELETE /available_boardgames/1.xml
  def destroy
    @available_boardgames = AvailableBoardgame.find(params[:id])
    @available_boardgames.destroy

    respond_to do |format|
      format.html { redirect_to(boardgames_meetups_url) }
      format.xml  { head :ok }
    end
  end
  def upvote
    available_boardgame = AvailableBoardgame.find(params[:id])
    current_user.up_vote(available_boardgame)

    respond_to do |format|
      format.html { redirect_to(available_boardgame.meetup) }
      format.xml  { head :ok }
    end
  end

  def downvote
    available_boardgame = AvailableBoardgame.find(params[:id])
    current_user.down_vote(available_boardgame)

    respond_to do |format|
      format.html { redirect_to(available_boardgame.meetup) }
      format.xml  { head :ok }
    end

  end
end
