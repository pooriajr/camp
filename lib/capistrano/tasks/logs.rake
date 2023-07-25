namespace :logs do
  desc "Tail application logs"
  task :tail_app do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/production.log"
    end
  end
end
