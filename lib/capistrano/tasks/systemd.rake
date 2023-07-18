namespace :deploy do
  desc 'Setup application service'
  task :setup_systemd do
    on roles(:app) do
      within release_path do
        systemd_config = <<~CONFIG
          [Unit]
          Description=#{fetch(:application)}
          After=network.target

          [Service]
          Type=simple
          WorkingDirectory=#{current_path}
          ExecStart=/root/.rbenv/shims/bundle exec rails s -e production -p #{fetch(:application_port)} 

          TimeoutSec=15
          Restart=always

          [Install]
          WantedBy=multi-user.target
        CONFIG

        # Create the systemd service file
        upload! StringIO.new(systemd_config), "/tmp/#{fetch(:application)}.service"

        # Move the service file into place and set permissions
        execute :sudo, :mv, "/tmp/#{fetch(:application)}.service", "/etc/systemd/system/#{fetch(:application)}.service"
        execute :sudo, :chmod, '644', "/etc/systemd/system/#{fetch(:application)}.service"

        # Reload systemd to make it aware of the new service
        execute :sudo, :systemctl, "daemon-reload"

        # Enable the service to start on boot
        execute :sudo, :systemctl, :enable, "#{fetch(:application)}.service"

        # Restart the service
        execute :sudo, :systemctl, :restart, "#{fetch(:application)}.service"
      end
    end
  end
  after :publishing, :setup_systemd
end

