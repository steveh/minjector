require "rest_client"
require "json/pure"

module Minjector
  class Writer
    class << self

      ENDPOINT = "http://127.0.0.1:3000/minjector"

      def write(payload)
        RestClient.post(ENDPOINT, :payload => JSON.generate(payload), :content_type => :json, :accept => :json)
      end

    end
  end
end