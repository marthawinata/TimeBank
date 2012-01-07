class BoardgamesController < ApplicationController
  # GET /boardgames
  # GET /boardgames.xml
  def index
    @boardgames = Boardgame.all

    require 'open-uri'
    doc = Nokogiri::HTML(open("http://http://boardgamegeek.com/boardgame/31260/"))

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boardgames }
    end
  end

  # GET /boardgames/1
  # GET /boardgames/1.xml
  def show
    @boardgame = Boardgame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boardgame }
    end
  end

  # GET /boardgames/new
  # GET /boardgames/new.xml
  def new
    @boardgame = Boardgame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boardgame }
    end
  end

  # GET /boardgames/1/edit
  def edit
    @boardgame = Boardgame.find(params[:id])
  end

  # POST /boardgames
  # POST /boardgames.xml
  def create
    @boardgame = Boardgame.new(params[:boardgame])

    respond_to do |format|
      if @boardgame.save
        format.html { redirect_to(@boardgame, :notice => 'Boardgame was successfully created.') }
        format.xml  { render :xml => @boardgame, :status => :created, :location => @boardgame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boardgame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boardgames/1
  # PUT /boardgames/1.xml
  def update
    @boardgame = Boardgame.find(params[:id])

    respond_to do |format|
      if @boardgame.update_attributes(params[:boardgame])
        format.html { redirect_to(@boardgame, :notice => 'Boardgame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boardgame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boardgames/1
  # DELETE /boardgames/1.xml
  def destroy
    @boardgame = Boardgame.find(params[:id])
    @boardgame.destroy

    respond_to do |format|
      format.html { redirect_to(boardgames_url) }
      format.xml  { head :ok }
    end
  end
end
