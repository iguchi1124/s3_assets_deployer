require 'aws-sdk-s3'

module S3AssetsDeployer
  class AwsS3
    def initialize(bucket: nil, prefix_key: nil)
      @bucket = bucket
      @prefix_key = prefix_key
    end

    def upload(files)
      files.each do |file|
        client.put_object(
          bucket: @bucket,
          key: [@prefix_key, file.key].compact.join('/'),
          body: file.body,
          content_type: file.content_type
        )
      end
    end

    private

    def client
      @client ||= Aws::S3::Client.new
    end
  end
end
