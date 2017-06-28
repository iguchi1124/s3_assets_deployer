namespace :assets do
  task deploy: :environment do
    S3AssetsDeployer.run
  end
end
