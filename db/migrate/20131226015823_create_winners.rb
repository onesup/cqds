class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.references  :user, index: true
      t.references  :gift, index: true
      t.integer     :serial
      t.datetime    :gifted_at
      t.timestamps
    end
  end
end
