class AddAccountNoAndBankNameAndIfscCodeAndBankBranchToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_no, :integer
    add_column :users, :bank_name, :string
    add_column :users, :ifsc_code, :string
    add_column :users, :bank_branch, :string
  end
end
