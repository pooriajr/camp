namespace :deploy do
  desc 'Update Caddy configuration'
  task :update_caddy do
    on roles(:web) do
      within release_path do
        caddy_config = <<~CONFIG
          #{fetch(:url)} {
            reverse_proxy localhost:#{fetch(:application_port)}
          }
        CONFIG

        # Write the configuration to a temporary file
        upload! StringIO.new(caddy_config), "/tmp/#{fetch(:application)}.caddy"

        # Move the configuration file into place
        execute :sudo, :mv, "/tmp/#{fetch(:application)}.caddy", "/etc/caddy/#{fetch(:application)}.caddy"

        # Change the permissions of the file to be read, write, and execute by all
        execute :sudo, :chmod, "777", "/etc/caddy/#{fetch(:application)}.caddy"

        # Restart Caddy to apply the changes
        execute :sudo, :systemctl, :restart, "caddy"
      end
    end
  end
  after :publishing, :update_caddy
end

