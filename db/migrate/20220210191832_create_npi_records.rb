class CreateNpiRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :npi_records do |t|
      t.integer :identifier
      t.string :enumeration_type
      t.integer :npi
      t.integer :last_updated_epoch
      t.integer :created_epoch
      t.string :first_name
      t.string :last_name
      t.string :credential
      t.boolean :sole_proprietor
      t.string :gender
      t.string :enumeration_date
      t.string :last_updated
      t.string :status
      t.string :name

      t.timestamps
    end
  end
end
