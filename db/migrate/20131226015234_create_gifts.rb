class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :quantity
      t.datetime :started_at
      t.datetime :finished_at
      t.timestamps
    end
  end
end
