class ProposedTimingsController < ApplicationController
  # GET /proposed_timings
  # GET /proposed_timings.xml
  def index
    @proposed_timings = ProposedTiming.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposed_timings }
    end
  end

  # GET /proposed_timings/1
  # GET /proposed_timings/1.xml
  def show
    @proposed_timing = ProposedTiming.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proposed_timing }
    end
  end

  # GET /proposed_timings/new
  # GET /proposed_timings/new.xml
  def new
    @proposed_timing = ProposedTiming.new(:meetup_id => params[:meetup_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposed_timing }
    end
  end

  # GET /proposed_timings/1/edit
  def edit
    @proposed_timing = ProposedTiming.find(params[:id])
  end

  # POST /proposed_timings
  # POST /proposed_timings.xml
  def create
    @proposed_timing = ProposedTiming.new(params[:proposed_timing])
    @proposed_timing.proposed_by_user = current_user.id
    respond_to do |format|
      if @proposed_timing.save
        format.html { redirect_to(@proposed_timing.meetup, :notice => 'Proposed timing was successfully created.') }
        format.xml  { render :xml => @proposed_timing.meetup, :status => :created, :location => @proposed_timing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proposed_timing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proposed_timings/1
  # PUT /proposed_timings/1.xml
  def update
    @proposed_timing = ProposedTiming.find(params[:id])

    respond_to do |format|
      if @proposed_timing.update_attributes(params[:proposed_timing])
        format.html { redirect_to(@proposed_timing, :notice => 'Proposed timing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proposed_timing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_timings/1
  # DELETE /proposed_timings/1.xml
  def destroy
    @proposed_timing = ProposedTiming.find(params[:id])
    @proposed_timing.destroy

    respond_to do |format|
      format.html { redirect_to(proposed_timings_url) }
      format.xml  { head :ok }
    end
  end

  def upvote
    timing = ProposedTiming.find(params[:timing_id])
    current_user.up_vote(timing)

    respond_to do |format|
      format.html { redirect_to(timing.meetup) }
      format.xml  { head :ok }
    end
  end

  def downvote
    timing = ProposedTiming.find(params[:timing_id])
    current_user.down_vote(timing)

    respond_to do |format|
      format.html { redirect_to(timing.meetup) }
      format.xml  { head :ok }
    end

  end
end
