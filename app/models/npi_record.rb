class NpiRecord < ApplicationRecord
  has_many :addresses
  has_many :identifiers
  has_many :taxonomies

  def self.update_or_create_by_identifier!(identifier)
    api_record_data = NpiRegistryService.new(identifier).get_record_data.first.with_indifferent_access
    record = find_or_create_by!(identifier: identifier)
    record.update!(npi_record_data(api_record_data))
    api_record_data[:addresses].each { |address| Address.create!(address.merge(npi_record: record)) }
    api_record_data[:taxonomies].each { |taxonomy| Taxonomy.create!(taxonomy.merge(npi_record: record)) }
    api_record_data[:identifiers].each { |identifier| Identifier.create!(identifier.merge(npi_record: record)) }
    api_record_data
  end

  private

  def self.npi_record_data(api_record_data)
    base_attrs = api_record_data.select do |key, _value|
      key == :enumeration_type || key == :number ||
        key == :last_updated_epoch || key == :created_epoch
    end
    base_attrs.merge(api_record_data[:basic].except('name_prefix', 'middle_name'))
  end
end
