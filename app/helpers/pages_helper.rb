require 'uri'

module PagesHelper
  def valid_url?(uri)
    uri = URI.parse(uri)
    uri.is_a?(URI::HTTP) && !uri.host.nil? && uri.open
  rescue URI::InvalidURIError || SocketError
    false
  end
end
