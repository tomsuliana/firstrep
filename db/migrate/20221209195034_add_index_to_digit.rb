class AddIndexToDigit < ActiveRecord::Migration[7.0]
  def change
    add_index :palindroms, :digit, unique: true
  end
end
