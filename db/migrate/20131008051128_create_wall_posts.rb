class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.text :message
      t.references :user, index: true
      t.text :options

      t.timestamps
    end
  end
end
