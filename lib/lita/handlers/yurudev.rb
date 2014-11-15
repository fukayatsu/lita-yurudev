require 'json'

module Lita
  module Handlers
    class Yurudev < Handler
      def self.default_config(handler_config)
        handler_config.kina_endpoint = ENV['KINA_ENDPOINT']
        handler_config.kina_uuid     = ENV['KINA_UUID']
      end

      route /^devroom users/, :devroom_users, command: false, help: { 'devroom users' => 'list users who is in the yurudev room' }
      def devroom_users(response)
        res = kina_api.get("/api/spots/#{config.kina_uuid}/users.json")
        response.reply "( ˘ω˘)？" if res.body.length == 0

        active_users = JSON.parse(res.body)['users'].select{ |user| user['active'] == true}
        names        = active_users.map{ |user| user['name'] }
        if names.empty?
          response.reply '( ˘ω˘)'
        else
          response.reply names.join(', ')
        end
      end

    private

      def config
        Lita.config.handlers.yurudev
      end

      def kina_api
        @conn ||= Faraday.new(url: config.kina_endpoint) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end

    Lita.register_handler(Yurudev)
  end
end
