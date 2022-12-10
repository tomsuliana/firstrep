class CreatePalindroms < ActiveRecord::Migration[7.0]
  def change
    create_table :palindroms do |t|
      t.integer :digit
      t.string :arr

      t.timestamps
    end
  end
end
