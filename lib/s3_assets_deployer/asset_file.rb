require 'mime/types'

module S3AssetsDeployer
  class AssetFile
    def initialize(path)
      @path = path
    end

    def key
      @path
    end

    def body
      File.new(@path)
    end

    def content_type
      MIME::Types.type_for(@path).first.to_s
    end
  end
end
