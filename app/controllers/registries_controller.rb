class RegistriesController < ApplicationController
  before_filter :get_registry
  before_filter :require_user, :except => [:introduction]
  
  filter_access_to :all
  
  # GET /registries
  # GET /registries.xml
  def index
    @registries = Registry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registries }
    end
  end

  # GET /registries/1
  # GET /registries/1.xml
  def show
    @registry = Registry.find(@registry_id)
    
    if !current_user.has_admission_to_registry(@registry)
      respond_to do |format|
        format.html { render "not_invited" }
        format.xml  { render :xml => @registry }
      end 
      return
    end
    
    @rsvp = Rsvp.find_or_create_by_registry_id_and_user_id(@registry.id, current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registry }
    end
  end

  # GET /registries/new
  # GET /registries/new.xml
  def new
    @registry = Registry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registry }
    end
  end

  # GET /registries/1/edit
  def edit
    @registry = Registry.find(@registry_id)
  end

  # POST /registries
  # POST /registries.xml
  def create
    @registry = Registry.new(params[:registry])

    respond_to do |format|
      if @registry.save
        format.html { redirect_to(celebration_path(@registry), :notice => 'Celebration was successfully created.') }
        format.xml  { render :xml => @registry, :status => :created, :location => @registry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registries/1
  # PUT /registries/1.xml
  def update
    @registry = Registry.find(@registry_id)

    respond_to do |format|
      if @registry.update_attributes(params[:registry])
        format.html { redirect_to(celebrations_path, :notice => 'Celebration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.xml
  def destroy
    @registry = Registry.find(@registry_id)
    @registry.destroy

    respond_to do |format|
      format.html { redirect_to(celebrations_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /registries/1/introduction
  # GET /registries/1/introduction.xml
  def introduction
    @registry = Registry.find(@registry_id)
    @user_session = UserSession.new
    session[:return_to] = celebration_path(@registry)

    respond_to do |format|
      format.html # introduction.html.erb
      format.xml  { render :xml => @registry }
    end
  end
  
  # GET /registries/1/rsvp
  # GET /registries/1/rsvp.xml
  def rsvp
    @registry = Registry.find(@registry_id)
    rsvp_params = params[:rsvp]
    rsvp = Rsvp.find_or_create_by_registry_id_and_user_id(@registry.id, current_user.id)
    
    session[:return_to] = celebration_path(@registry)

    respond_to do |format|
      if rsvp.update_attributes(rsvp_params)
        notice = "We are so sorry to hear that you won't be able to make it."
        notice = "We are so excited to hear that you will be joining us!" if rsvp.attending == true
        
        format.html { redirect_to(celebration_path(@registry), :notice => notice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registry.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  
    def get_registry
      if params[:id]
        registry = params[:id].to_s
        begin
          record = Registry.find_by_permalink(registry)
          @registry_id = record.id
        rescue Exception => e
          back = e.backtrace.join("\n\t")
          s = "rescued_from:: gifts:get_registry(#{@registry_id}): #{e.inspect}\n#{back}"
          logger.error(s)
        end
      else
        @registry_id = params[:id]
      end
    end
end
