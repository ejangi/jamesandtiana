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
    @registry = Registry.find(params[:id])
  end

  # POST /registries
  # POST /registries.xml
  def create
    @registry = Registry.new(params[:registry])

    respond_to do |format|
      if @registry.save
        format.html { redirect_to(@registry, :notice => 'Registry was successfully created.') }
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
    @registry = Registry.find(params[:id])

    respond_to do |format|
      if @registry.update_attributes(params[:registry])
        format.html { redirect_to(@registry, :notice => 'Registry was successfully updated.') }
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
    @registry = Registry.find(params[:id])
    @registry.destroy

    respond_to do |format|
      format.html { redirect_to(registries_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /registries/1/introduction
  # GET /registries/1/introduction.xml
  def introduction
    @registry = Registry.find(@registry_id)
    @user_session = UserSession.new
    session[:return_to] = url_for(:registry_permalink => @registry.permalink)

    respond_to do |format|
      format.html # introduction.html.erb
      format.xml  { render :xml => @registry }
    end
  end
  
  private
  
    def get_registry
      if params[:registry_permalink]
        registry = params[:registry_permalink].to_s
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
