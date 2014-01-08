class CreateFreeRiders < ActiveRecord::Migration
  def change
    create_table :free_riders do |t|
      t.references :user

      t.timestamps
    end
  end
end
