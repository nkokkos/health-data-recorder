# == Schema Information
#
# Table name: chronic_diseases
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ChronicDisease < ActiveRecord::Base
  self.table_name = 'chronic_diseases'
  has_and_belongs_to_many :users, join_table: :chronic_diseases_users
end
