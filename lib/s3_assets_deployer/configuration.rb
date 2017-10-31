module S3AssetsDeployer
  class Configuration
    attr_accessor :assets,
                  :s3

    class AssetsConfiguration < Struct.new(:root_path, :prefix_paths)
      def initialize
        self.root_path = Rails.root.join('public')
        self.prefix_paths = ['assets']
      end
    end

    class S3Configuration < Struct.new(:bucket, :prefix_key)
      def initialize
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
