class AddSmokingFrequenciesIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :smoking_frequency_id, :integer
  end
end
