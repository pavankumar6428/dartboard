class CampaignsController < ApplicationController
    before_filter :authenticate_user!

  def index
    @campaigns = Campaign.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaign }
    end

  end

  def show
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campaign }
    end
  end

  def new
		@campaign = Campaign.new
  end

  def create
    @campaign = Campaign.build(params[:campaign])
    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaign_path(@campaign.id), :notice => 'New campaign was successfully created.'}
        format.xml  { render :xml => @campaign.branchid, :status => :created, :location => @campaign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to campaign_path(@campaign.id), :notice => 'campaign was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

   def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to(campaigns_path) }
      format.xml  { head :ok }
    end
  end

end
