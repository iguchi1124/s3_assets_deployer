require 'mime/types'

module S3AssetsDeployer
  class AssetFile
    def initialize(path, realpath)
      @path = path
      @realpath = realpath
    end

    def key
      @path
    end

    def body
      File.new(@realpath)
    end

    def content_type
      MIME::Types.type_for(@path).first.to_s
    end
  end
end
