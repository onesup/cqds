class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :access_token
      t.text :data
      t.references :user, index: true
      t.references :identifiable, polymorphic: true, index: true
      t.datetime :expired_at
      t.timestamps
    end
  end
end
