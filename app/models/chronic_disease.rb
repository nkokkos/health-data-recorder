class ChronicDisease < ActiveRecord::Base
  self.table_name = 'chronic_diseases'
  has_and_belongs_to_many :users, join_table: :chronic_diseases_users
end
