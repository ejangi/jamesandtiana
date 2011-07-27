authorization do
  role :admin do
    includes :guest
    has_permission_on :registries, :to => :manage
    has_permission_on :gifts, :to => :manage
    has_permission_on :users, :to => :manage
  end
  
  role :engagement do
    has_permission_on :gifts, :to => :view
    has_permission_on :user_sessions, :to => [:destroy]
    has_permission_on :registries, :to => [:show, :introduction]
  end
  
  role :guest do
    has_permission_on :registries, :to => [:introduction]
    has_permission_on :user_sessions, :to => [:new, :create]
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