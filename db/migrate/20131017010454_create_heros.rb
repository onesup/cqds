class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.integer :total
      t.references :user, index: true
      t.references :wall_post, index: true

      t.timestamps
    end
  end
end
