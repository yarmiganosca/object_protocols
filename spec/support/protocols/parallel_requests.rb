module Protocols
  module ParallelRequests
    def self.new
      ObjectProtocol.new(:client, :endpointA, :endpointB) do
        in_any_order do
          client.sends(:get).to(endpointA)
          client.sends(:get).to(endpointB)
        end
      end
    end

    class Client < Struct.new(:endpoints)
      def request
        endpoints.each(&:get)
      end
    end

    class Endpoint
      def get
      end
    end
  end
end
