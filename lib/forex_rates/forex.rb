require "json"
require "faraday-http-cache"

module ForexRates
    class ForexRatesError < StandardError; end

    class Forex
        attr_accessor :api

        def initialize(*cache_opts)
            if cache_opts[0] && cache_opts[0].size > 0
                @api = Api.new do |builder|
                     builder.use :http_cache, cache_opts[0]
                     builder.adapter Faraday.default_adapter
                end
            else
                @api = Api.new
            end

        end

        def get_latest(*opts)
            resp = api.get_latest(opts)
            JSON.parse resp.body
        end

        def get_historical(start_date, end_date, *opts)
            raise ForexRatesError.new "Date is not correct" unless verify_date(start_date) && verify_date(end_date)
            resp = api.get_history(start_date, end_date, opts)
            JSON.parse resp.body
        end

        def get_for_a_day(date, *opts)
            raise ForexRatesError.new "Date is not correct" unless verify_date(date)
            resp = api.get_for_a_day(date,opts)
            JSON.parse resp.body
        end

        private

        def verify_date(date)
            date.match?(/\d{4}-\d{2}-\d{2}/)
        end
    end
  end