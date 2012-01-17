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
    
    @selected_boardgames = AvailableBoardgame.where(:user_id => current_user.id, :meetup_id => params[:meetup_id]).collect { |available_boardgame| available_boardgame.boardgame }
    @owned_boardgames = Collection.where(:user_id => current_user.id).collect { |collection| collection.boardgame } | @selected_boardgames

    @selected_boardgame_ids = @selected_boardgames.collect { |boardgame| boardgame.id } 

    @matching_boardgames = []

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
    selected_boardgame_ids = params[:available_boardgame][:boardgame_id] || []
    meetup_id = params[:available_boardgame][:meetup_id]

    previously_selected_boardgames = AvailableBoardgame.where(:meetup_id => meetup_id, :user_id => current_user.id)
    boardgames_to_delete = previously_selected_boardgames.collect { |bg| bg.boardgame_id } - selected_boardgame_ids unless previously_selected_boardgames.nil?
    AvailableBoardgame.delete_all(:boardgame_id => boardgames_to_delete)

    selected_boardgame_ids.each do |selected_boardgame|
      available_boardgame = AvailableBoardgame.new(:user => current_user, :meetup_id => meetup_id, :boardgame_id => selected_boardgame)
      available_boardgame.save      
    end

    redirect_to meetup_path(meetup_id), :notice => "Available boardgames successfully updated."
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

  def search
    search_term = params[:search_term]

    @matching_boardgames = Boardgame.paginate(:page => params[:page], :per_page => 10, :conditions => ['name like ?', "%#{search_term}%"], :order => 'name')
    
#    boardgames = Boardgame.arel_table
#    query = Boardgame.where(boardgames[:name].matches("%#{search_term}%"))
#    @matching_boardgames_count = query.count
#    @matching_boardgames = query.
#      limit(10).
#      offset(offset.to_i)
    
    respond_to do |format|
      format.js 
    end
  end

  # DELETE /available_boardgames/1
  # DELETE /available_boardgames/1.xml
  def destroy
    @available_boardgames = AvailableBoardgame.find(params[:id])
    meetup = @available_boardgames.meetup
    name = @available_boardgames.boardgame.name
    @available_boardgames.destroy

    redirect_to meetup, :notice => "Removed game #{name} from meetup."
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
