class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country_code
      t.string :country_name
      t.string :address_purpose
      t.string :address_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :telephone_number
      t.string :fax_number
      
      t.timestamps
    end
  end
end
