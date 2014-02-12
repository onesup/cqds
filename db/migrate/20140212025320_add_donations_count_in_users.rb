class AddDonationsCountInUsers < ActiveRecord::Migration
  def change
    add_column :users, :donations_count, :integer, default: 0
    User.reset_column_information
    User.find_each do |user|
      User.reset_counters user.id, :donations
    end
  end
end
