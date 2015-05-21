class CreateJoinTableUserChronicDisease < ActiveRecord::Migration
  def change
    create_join_table :users, :chronic_diseases do |t|
      # t.index [:user_id, :chronic_disease_id]
      # t.index [:chronic_disease_id, :user_id]
    end
  end
end
