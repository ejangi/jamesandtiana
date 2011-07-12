set :application, "jamesandtiana"
set :repository,  "ssh://root@ejangi.com/git/jamesandtiana.git"

set :user, "root"
set :scm, :git
set :use_sudo, false
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :deploy_to, "/websites/jamesandtiana.com"
default_run_options[:pty] = true


role :web, "jamesandtiana.com"                          # Your HTTP server, Apache/etc
role :app, "jamesandtiana.com"                          # This may be the same as your `Web` server
role :db,  "jamesandtiana.com", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, '.bundle')
    release_dir = File.join(release_path, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :install, :roles => :app do
    run "cd #{release_path} && bundle install --deployment"
    run "cd #{release_path} && rake db:migrate RAILS_ENV=\"production\""

    on_rollback do
      if previous_release
        run "cd #{previous_release} && bundle install --deployment"
        run "cd #{release_path} && rake db:rollback RAILS_ENV=\"production\""
      else
        logger.important "no previous release to rollback to, rollback of bundler:install skipped"
      end
    end
  end

  task :bundle_new_release, :roles => :db do
    bundler.create_symlink
    bundler.install
  end
end

after "deploy:rollback:revision", "bundler:install"
after "deploy:update_code", "bundler:bundle_new_release"