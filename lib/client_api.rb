class ClientApi
  include HTTParty
  base_uri 'http://staging-pos-api.itsacheckmate.com/v1/locations/1/queue'

  def initialize()
    @json = { query: {site: service, page: page} }
  end
  
end