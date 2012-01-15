class InvitationsController < ApplicationController

  # GET /invitations
  # GET /invitations.xml
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitations }
    end
  end

  def receive_response
    invitation = Invitation.where(:secret_url => params[:url]).first
    unless invitation.nil?
      user = User.where(:email => invitation.email).first || User.new(:email => invitation.email,
        :password => "aaaaaaaa", :is_registered => false)
      user.save
      sign_in(:user, user)
      

      redirect_to invitation.meetup
    end
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])
    @meetup = @invitation.meetup

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new(:meetup_id => params[:meetup_id])
    if @invitation.meetup.can_join?(current_user)

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @invitation }
      end
    else
      redirect_to @invitation.meetup, :notice => "cannot invite others on this meetup"
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.xml
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.secret_url = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
    
    respond_to do |format|
      if @invitation.save
        
        UserMailer.invitation_email(current_user,@invitation).deliver
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully created.') }
        format.xml  { render :xml => @invitation, :status => :created, :location => @invitation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to(invitations_url) }
      format.xml  { head :ok }
    end
  end


end
