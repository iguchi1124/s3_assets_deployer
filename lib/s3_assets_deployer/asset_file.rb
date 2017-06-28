require 'mime/types'

module S3AssetsDeployer
  class AssetFile
    attr_reader :prefix

    def initialize(prefix, path)
      @prefix = prefix
      @path = path
    end

    def key
      [prefix, File.basename(@path)].join('/')
    end

    def body
      File.new(@path)
    end

    def content_type
      MIME::Types.type_for(@path).first.to_s
    end
  end
end
