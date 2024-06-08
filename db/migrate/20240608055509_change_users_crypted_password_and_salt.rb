class ChangeUsersCryptedPasswordAndSalt < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :crypted_password, true
    change_column_null :users, :salt, true
  end
end
