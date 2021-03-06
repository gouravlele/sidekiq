# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "sidekiq_app"
set :repo_url, "git@github.com:gouravlele/sidekiq.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "master"
set :user, "ubuntu"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/sidekiq_app"
set :use_sudo, false
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5
set :ssh_options, {
   keys: %w(/home/yuva/Downloads/sidekiqpem.pem),
   forward_agent: true,
   user: 'ubuntu'
 }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
        # run :rake, 'cache:clear'      
        run "sudo service nginx restart"
      # end
    end
  end
end
