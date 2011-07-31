require 'bundler/capistrano'

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

# SETUP UPLOADS FOLDER:
namespace :uploads do

  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
    run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod 0777 #{dirs.join(' ')}"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.

    Note. I can't set value for directories directly in the code because
    I don't know in advance selected stage.
  EOD
  task :register_dirs do
    set :uploads_dirs,    %w(uploads uploads/tmp uploads/gift uploads/registry).map { |d| "#{d}" }
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink"
  on :start,  "uploads:register_dirs"

end

namespace :logs do
  desc <<-EOD
    Make sure permissions on the /log/ directory is set correctly
  EOD
  task :chmod, :except => { :no_release => true } do
    run "cd #{release_path} && chmod -R 0666 log/*"
  end
  
  after       "deploy:finalize_update", "logs:chmod"
end