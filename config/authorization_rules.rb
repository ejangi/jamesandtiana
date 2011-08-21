authorization do
  role :guest do
    has_permission_on :registries, :to => [:introduction]
    has_permission_on :user_sessions, :to => [:new, :create]
    has_permission_on :pages, :to => [:show]
  end
  
  role :admin do
    includes :guest
    has_permission_on :registries, :to => :manage
    has_permission_on :registries, :to => :rsvp
    has_permission_on :celebrations, :to => :manage
    has_permission_on :celebrations, :to => :rsvp
    has_permission_on :contributions, :to => :manage
    has_permission_on :pages, :to => :manage
    has_permission_on :rsvps, :to => :manage
    has_permission_on :gifts, :to => :manage
    has_permission_on :gifts, :to => [:contribute, :contribution, :orderlike]
    has_permission_on :users, :to => :manage
  end
  
  role :engagement do
    has_permission_on :gifts, :to => :view
    has_permission_on :gifts, :to => [:contribute, :contribution]
    has_permission_on :user_sessions, :to => [:destroy]
    has_permission_on :registries, :to => [:show, :introduction, :rsvp]
    has_permission_on :celebrations, :to => [:show, :introduction, :rsvp]
    has_permission_on :account, :to => [:show]
    has_permission_on :users, :to => [:show]
    has_permission_on :pages, :to => [:show]
  end
  
  role :wedding do
    includes :engagement
  end
end



privileges do
  privilege :view do
    includes :index, :show
  end
  
  privilege :manage do
    includes :index, :new, :show, :create, :edit, :update, :destroy
  end
end