class AddAgeAndIncomeAndEducationAndOccupationAndGenderAndFamilyStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :income, :integer
    add_column :users, :education, :string
    add_column :users, :occupation, :string
    add_column :users, :gender, :string
    add_column :users, :family_status, :string
  end
end
