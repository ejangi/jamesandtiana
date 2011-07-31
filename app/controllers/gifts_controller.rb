class GiftsController < ApplicationController
  before_filter :get_registry
  filter_access_to :all
  
  # GET /gifts
  # GET /gifts.xml
  def index
    @gifts = Gift.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gifts }
    end
  end

  # GET /gifts/1
  # GET /gifts/1.xml
  def show
    @gift = Gift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gift }
    end
  end

  # GET /gifts/new
  # GET /gifts/new.xml
  def new
    @gift = Gift.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gift }
    end
  end

  # GET /gifts/1/edit
  def edit
    @gift = Gift.find(params[:id])
  end

  # POST /gifts
  # POST /gifts.xml
  def create
    @gift = Gift.new(params[:gift])

    respond_to do |format|
      if @gift.save
        format.html { redirect_to(gifts_path, :notice => 'Gift was successfully created.') }
        format.xml  { render :xml => @gift, :status => :created, :location => @gift }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gifts/1
  # PUT /gifts/1.xml
  def update
    @gift = Gift.find(params[:id])

    respond_to do |format|
      if @gift.update_attributes(params[:gift])
        format.html { redirect_to(gifts_path, :notice => 'Gift was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.xml
  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to(gifts_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /gifts/1/contribute
  def contribute
    @gift = Gift.find(params[:gift_id])
    
    if !@registry
      flash[:error] = "You must click on a celegration and then click on gifts to make a contribution"
      redirect_to(root_url)
      return
    end
    
    @contribution = Contribution.find_or_initialize_by_registry_id_and_gift_id_and_user_id(@registry.id, @gift.id, current_user.id)
    @contribution.amount = @gift.price.to_i if @contribution.amount.nil?
    
    respond_to do |format|
      format.html # contribute.html.erb
      format.xml  { render :xml => @gift }
    end
  end
  
  # PUT /gifts/1/contribution
  def contribution
    @gift = Gift.find(params[:gift_id])
    
    if !@registry
      flash[:error] = "You must click on a celegration and then click on gifts to make a contribution"
      redirect_to(root_url)
      return 
    end
    
    @contribution = Contribution.find_or_create_by_registry_id_and_gift_id_and_user_id(@registry.id, @gift.id, current_user.id)
    
    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        format.html { redirect_to(celebration_gifts_path(@registry), :notice => 'Thank you for your contribution.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "contribute" }
        format.xml  { render :xml => @contribution.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  
    def get_registry
      @registry_id = params[:celebration_id]
      begin
        @registry = Registry.find_by_permalink(@registry_id.to_s)
      rescue Exception => e
        back = e.backtrace.join("\n\t")
        s = "rescued_from:: gifts:get_registry(#{@registry_id}): #{e.inspect}\n#{back}"
        logger.error(s)
        redirect_to root_url
      end
    end
end
