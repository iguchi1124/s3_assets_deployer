require 's3_assets_deployer/asset_file'

module S3AssetsDeployer
  class Deployer
    def initialize(storage:, root_path:, prefix_paths:, ignore_paths:)
      @storage = storage
      @root_path = root_path
      @prefix_paths = prefix_paths
      @ignore_paths = ignore_paths.map { |path| File.join(root_path, path) }
    end

    def run
      @storage.upload(files)
    end

    private

    def files
      @files ||= @prefix_paths.flat_map do |prefix|
        Dir.glob(@root_path.join(prefix).join('**', '**')).map do |path|
          AssetFile.new(prefix, path) if Pathname.new(path).file? && !@ignore_paths.include?(path)
        end
      end.compact
    end
  end
end
