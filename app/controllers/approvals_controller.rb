class ApprovalsController < ApplicationController
  # GET /approvals
  # GET /approvals.xml
  def index
    @approvals = Approval.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approvals }
    end
  end

  # GET /approvals/1
  # GET /approvals/1.xml
  def show
    @approval = Approval.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approval }
    end
  end

  # GET /approvals/new
  # GET /approvals/new.xml
  def new
    @approval = Approval.new
    @approval.meetup_id = params[:meetup_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approval }
    end
  end

  # GET /approvals/1/edit
  def edit
    @approval = Approval.find(params[:id])
  end

  def receive_response
    @approval = Approval.where(:id => params[:id]).first
    redirect_to(@approval.meetup, :notice => 'Approval has already expired') if @approval.status == Approval::EXPIRED
    if @approval.url_to_reject == params[:url]
      @approval.is_approved = false
      @approval.status = Approval::EXPIRED
      @approval.save
      redirect_to(@approval.meetup, :notice => "You have rejected in the request of #{@approval.user.email} to join meetup")
    elsif @approval.url_to_approve == params[:url]
      @approval.is_approved = true
      @approval.status = Approval::EXPIRED
      @approval.meetup.users.push(@approval.user)
      @approval.save
      redirect_to(@approval.meetup, :notice => "You have approved in the request of #{@approval.user.email} to join meetup")
    else
      redirect_to(@approval.meetup, :notice => 'The url you have is not correct')
    end
  end

  # POST /approvals
  # POST /approvals.xml
  def create
    @approval = Approval.new(params[:approval])
    @approval.user = current_user
    @approval.status = Approval::ACTIVE
    @approval.is_approved = false
    @approval.url_to_approve = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
    @approval.url_to_reject = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join

    respond_to do |format|
      if @approval.save
        UserMailer.request_for_approval_email(@approval).deliver
        format.html { redirect_to(@approval, :notice => 'Approval was successfully created.') }
        format.xml  { render :xml => @approval, :status => :created, :location => @approval }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approvals/1
  # PUT /approvals/1.xml
  def update
    @approval = Approval.find(params[:id])

    respond_to do |format|
      if @approval.update_attributes(params[:approval])
        format.html { redirect_to(@approval, :notice => 'Approval was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.xml
  def destroy
    @approval = Approval.find(params[:id])
    @approval.destroy

    respond_to do |format|
      format.html { redirect_to(approvals_url) }
      format.xml  { head :ok }
    end
  end
end
