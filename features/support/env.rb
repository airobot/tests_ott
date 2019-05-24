require 'uri'
require 'net/http'
require 'json'

def get_request(url)
  Net::HTTP.get(url).force_encoding('utf-8')
end

def get_response(url)
  Net::HTTP.get_response(URI.parse(url))
end

def parse_json(json_string)
  JSON.parse(json_string)
end

def json_results
  parse_json(parse_json(@response)['result'].to_json)
end