require 'fracas/dataset/mutations'
require 'fracas/dataset/actions'
require 'fracas/dataset/query'

module Fracas
  class Dataset
    include Enumerable
    include Mutations
    include Actions
    include Query

    attr_reader :client, :query, :results

    def initialize(url_or_client)
      @query = {
        indices: [],
        types:   [],
        filters: []
      }

      @client = if url_or_client.is_a?(Elasticsearch::Transport::Client)
                  url_or_client
                else
                  Elasticsearch::Client.new(url: url_or_client)
                end
    end
  end
end
