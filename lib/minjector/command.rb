module Minjector
  class Command

    def self.inject
      generate_example_config unless Config.exists?

      payload = Config.read

      payload[:buckets].each do |bucket|
        puts "Reading #{bucket[:name]}..."

        bucket[:entries] = Reader.read(bucket[:path])
      end

      Writer.write(payload)
    end

    def self.generate_example_config
      Config.write(Config.example)
    end

  end
end