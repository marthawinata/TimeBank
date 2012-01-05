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
      format.xml  { render :xml => @available_boardgame }
    end
  end

  # GET /available_boardgames/new
  # GET /available_boardgames/new.xml
  def new
    @available_boardgame = AvailableBoardgame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @available_boardgame }
    end
  end

  # GET /available_boardgames/1/edit
  def edit
    @available_boardgame = AvailableBoardgame.find(params[:id])
  end

  # POST /available_boardgames
  # POST /available_boardgames.xml
  def create
    @available_boardgame = AvailableBoardgame.new(params[:available_boardgame])

    respond_to do |format|
      if @available_boardgame.save
        format.html { redirect_to(@available_boardgame, :notice => 'Available boardgame was successfully created.') }
        format.xml  { render :xml => @available_boardgame, :status => :created, :location => @available_boardgame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @available_boardgame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /available_boardgames/1
  # PUT /available_boardgames/1.xml
  def update
    @available_boardgame = AvailableBoardgame.find(params[:id])

    respond_to do |format|
      if @available_boardgame.update_attributes(params[:available_boardgame])
        format.html { redirect_to(@available_boardgame, :notice => 'Available boardgame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @available_boardgame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /available_boardgames/1
  # DELETE /available_boardgames/1.xml
  def destroy
    @available_boardgame = AvailableBoardgame.find(params[:id])
    @available_boardgame.destroy

    respond_to do |format|
      format.html { redirect_to(available_boardgames_url) }
      format.xml  { head :ok }
    end
  end
end
