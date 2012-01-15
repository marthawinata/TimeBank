require 'board_game_geek'

class CollectionsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /collections
  # GET /collections.xml
  def index
    @collections = Collection.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.xml
  def show
    @collection = Collection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.xml
  def new
    @collection = Collection.new
    @user = current_user
    @boardgames = Boardgame.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
    @user = current_user
    @boardgames = Boardgame.all

  end

  # POST /collections
  # POST /collections.xml
  def create
    @collection = Collection.new(params[:collection])
    @collection.user = current_user
    respond_to do |format|
      if @collection.save
        format.html { redirect_to(@collection, :notice => 'Collection was successfully created.') }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.xml
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to(@collection, :notice => 'Collection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.xml
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(collections_url) }
      format.xml  { head :ok }
    end
  end

  def import
    if (current_user.bgg_username.nil?)
      redirect_to(edit_user_registration_path, :notice => "Need to set BoardGameGeek username in profile to before games can be imported.") and return
    end

    bgg = BoardGameGeek.new
    bgg.get_owned_boardgames(current_user.bgg_username).each do |owned_boardgame|
      if (owned_boardgame.id.nil?)
        owned_boardgame.save
      end

      if (Collection.where(:boardgame_id => owned_boardgame.id, :user_id => current_user.id).empty?)
        Collection.new(:boardgame_id => owned_boardgame.id, :user => current_user).save
      end
    end

    redirect_to({:action => 'index'}, :notice => 'Collection from BoardGameGeek was imported successfully')
  end
end

