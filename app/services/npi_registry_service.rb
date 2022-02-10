class NpiRegistryService
  API_VERSION = '2.0'

  def initialize(identifier)
    @identifier = identifier.to_s
  end

  def get_record_data
    url = "https://npiregistry.cms.hhs.gov/api/?version=#{API_VERSION}&number=#{@identifier}"
    response = Faraday.new(url: url).get
    raise InvalidRequest if response.status.to_s.first == '4'
    raise ApiServerError if response.status.to_s.first == '5'
    results = JSON.parse(response.body)['results']
    raise NoApiRecordDataError if results.blank?

    results
  end

  class InvalidRequest < StandardError; end
  class ApiServerError < StandardError; end
  class NoApiRecordDataError < StandardError; end
end
