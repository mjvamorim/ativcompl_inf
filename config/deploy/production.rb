# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{root@10.11.8.11}
role :web, %w{root@10.11.8.11}
role :db,  %w{root@10.11.8.11}

# Define server(s)
server '10.11.8.11', user: 'amorim', roles: %w{web}
set :use_sudo, true
set :deploy_to, "'/var/www/html/AtivCompl'"

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: true,
    auth_methods: %w(publickey password),
    password: 'ifzl1987',
    user: 'amorim',
    port: '22'
}