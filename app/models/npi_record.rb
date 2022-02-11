class NpiRecord < ApplicationRecord
  has_many :addresses
  has_many :identifiers
  has_many :taxonomies

  def self.update_or_create_by_identifier!(identifier)
    api_record_data = NpiRegistryService.new(identifier)
                                        .get_record_data
                                        .first
                                        .with_indifferent_access
    find_or_create_by!(identifier: identifier).update!(npi_record_data(api_record_data))
    api_record_data[:addresses].each { |address| Address.create!(address) }
    api_record_data[:taxonomies].each { |taxonomy| Taxonomy.create!(taxonomy) }
    api_record_data[:identifiers].each { |identifier| Identifier.create!(identifier) }
    api_record_data
  end

  private

  def self.npi_record_data(api_record_data)
    base_attrs = api_record_data.select do |key, _value|
      key == :enumeration_type || key == :number ||
        key == :last_updated_epoch || key == :created_epoch
    end
    base_attrs.merge(api_record_data[:basic])
  end
end
