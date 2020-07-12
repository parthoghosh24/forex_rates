require "faraday"

module ForexRates
    class Api < Faraday::Connection
        def initialize(url="https://api.exchangeratesapi.io")
            super(url)
        end

        def get_latest(params)
            self.get "/latest#{build_query_params(params[0])}"
        end

        def get_history(start_date, end_date, params)
            params_hash = params[0]
            params_hash.merge!({start_date: start_date, end_date: end_date})
            self.get "/history#{build_query_params(params_hash)}"
        end

        def get_for_a_day(date, params)
            self.get "/#{date}#{build_query_params(params[0])}"
        end

        private

        def build_query_params(params)
            return nil unless params && params.size > 0
            query_params = "?"
            params.each_with_index do |(key, val), index|
                index == 0 ? query_params << "#{key}=#{val}" : query_params << "&#{key}=#{val}"
            end
            query_params
        end

    end
end