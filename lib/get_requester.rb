require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

#  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
  def initialize(url)
    @url = url
  end

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json    
    people = JSON.parse(self.get_response_body)
    result = people.collect do |person|
        { "name" => person["name"],
          "occupation" => person["occupation"] }
    end
    result
  end
end