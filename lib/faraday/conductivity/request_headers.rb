module Faraday
  module Conductivity
    class RequestHeaders < Faraday::Middleware

      def initialize(app, headers)
        super(app)
        @headers = headers
      end

      def call(env)
        @headers.each do |header, value|
          env[:request_headers][header] ||= value
        end
        @app.call(env)
      end

    end
  end
end
