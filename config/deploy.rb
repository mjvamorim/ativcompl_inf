# config valid only for current version of Capistrano
#lock '3.4.0'


set :application, 'AtivCompl'
set :repo_url,  "'https://github.com/mjvamorim/AtivCompl.git'"
set :scm, :git
#set :deploy_to, "'/Users/Amorim/Google Drive/www/AtivCompl'"
set :deploy_to, "'/var/www/html/AtivCompl'"
set :passenger_restart_with_touch, true
set :pty, true

set :format, :pretty

#set :passenger_in_gemfile, true
namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end


