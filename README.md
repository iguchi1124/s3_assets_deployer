# S3AssetsDeployer
Asset files deployer for rails application.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 's3_assets_deployer'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install s3_assets_deployer
```

## Usage

### Rails
Add initializer at `config/iniitializers/s3_assets_deployer.rb`
```rb
AssetsDeployer.configure do |config|
  config.assets.root_path   = Rails.root.join('public')
  config.assets.prefix_paths = ['assets', 'packs']
  config.assets.ignore_paths = ['packs/manifest.json']
  # your storage service configurations
  config.s3.region     = 'ap-northeast-1'
  config.s3.bucket     = 'bucket_name'
  config.s3.prefix_key = 'project_name'
  # credentials
  # Also, you can use environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) or instance profile credentials
  config.s3.credentials[:access_key_id]     = 'aws_access_key_id'
  config.s3.credentials[:secret_access_key] = 'aws_secret_access_key'
end
```

then you can use this rails command
```console
$ bundle exec rails assets:precompile assets:deploy
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
