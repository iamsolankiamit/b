class AddVatIdNumberAndVatCompanyNameAndVatCountryIsoToUser < ActiveRecord::Migration
  def change
    add_column :users, :vat_id_number, :string
    add_column :users, :vat_company_name, :string
    add_column :users, :vat_country_iso, :string
  end
end
