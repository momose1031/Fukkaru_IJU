class RenamePasswordColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :password, :encrypted_password
  end
end
