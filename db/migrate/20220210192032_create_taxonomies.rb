class CreateTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :taxonomies do |t|
      t.belongs_to :npi_record
      t.string :code
      t.string :desc
      t.boolean :primary
      t.string :state
      t.string :license

      t.timestamps
    end
  end
end
