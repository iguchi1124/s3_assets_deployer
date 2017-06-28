module S3AssetsDeployer
  class Configuration
    attr_accessor :assets,
                  :s3

    class AssetsConfiguration < Struct.new(:root_path, :prefix_paths, :ignore_paths)
      def initialize
        self.prefix_paths = ['assets']
        self.ignore_paths = []
      end
    end

    class S3Configuration < Struct.new(:credentials, :bucket, :prefix_key, :region)
      def initialize
        self.credentials = {}
      end
    end

    def assets
      @assets ||= AssetsConfiguration.new
    end

    def s3
      @s3 ||= S3Configuration.new
    end
  end
end
