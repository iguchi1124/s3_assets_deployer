require 's3_assets_deployer/deployer'
require 's3_assets_deployer/configuration'
require 's3_assets_deployer/aws_s3'

module S3AssetsDeployer
  def self.run
    deployer = Deployer.new(
      storage: s3,
      root_path: config.assets.root_path,
      prefix_paths: config.assets.prefix_paths,
    )

    deployer.run
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end

  def self.s3
    @s3 ||= AwsS3.new(
      credentials: config.s3.credentials,
      bucket: config.s3.bucket,
      prefix_key: config.s3.prefix_key,
      region: config.s3.region
    )
  end
end

require 's3_assets_deployer/engine' if defined?(Rails)
