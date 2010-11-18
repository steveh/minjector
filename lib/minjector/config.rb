require "yaml"
require "fileutils"

module Minjector
  class Config
    class << self

      def file
        File.expand_path(File.join("~", ".minjector", "config"))
      end

      def read
        config = {}

        File.open(file, "r") do |f|
          config = YAML.load(f)
        end

        config[:buckets].each do |bucket|
          bucket[:path] = File.expand_path(bucket[:path])
        end

        config
      end

      def exists?
        File.exist?(file)
      end

      def write(config)
        unless exists?
          FileUtils.mkdir_p(File.dirname(file))
        end

        File.open(file, "w") do |f|
          return YAML.dump(config, f)
        end
      end

      private

        def example
          {
            :token => "YOUR_API_TOKEN",
            :buckets => [
              {
                :name => "Movies",
                :path => File.expand_path("~/Movies")
              }
            ]
          }
        end

    end
  end
end