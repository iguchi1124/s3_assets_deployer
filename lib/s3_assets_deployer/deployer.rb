require 's3_assets_deployer/asset_file'

module S3AssetsDeployer
  class Deployer
    def initialize(storage:, root_path:, prefix_paths:)
      @storage = storage
      @root_path = root_path
      @prefix_paths = prefix_paths
    end

    def run
      @storage.upload(files)
    end

    private

    def files
      @files ||= @prefix_paths.flat_map do |prefix|
        Dir.chdir(@root_path) do
          Dir.glob(Pathname.new(prefix).join('**', '**')).map do |path|
            AssetFile.new(path, File.realpath(path)) if Pathname.new(path).file?
          end
        end
      end.compact
    end
  end
end
