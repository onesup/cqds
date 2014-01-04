class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user
      t.integer :total

      t.timestamps
    end
  end
end
