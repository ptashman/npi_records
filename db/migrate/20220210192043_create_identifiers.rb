class CreateIdentifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :identifiers do |t|
      t.belongs_to :npi_record
      t.string :identifier
      t.string :code
      t.string :desc
      t.string :state
      t.string :issuer

      t.timestamps
    end
  end
end
