# == Schema Information
#
# Table name: settings
#
#  id                    :integer          not null, primary key
#  allow_doctor_tracking :boolean
#  device_id             :integer
#  measure_id            :integer
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Setting < ActiveRecord::Base
  #setting table is used to store user preference on whether
  #the user wants to expose data to doctor/personell. Also, the
  #settings table exposes ability for the user to choose which
  #device should be used to BMI/Fat % calculation

  belongs_to :user

  # used by rails_admin to display look up values correctly in /admin:
  # starts here:
  def device_id_enum
    Device.all.map { |u| ["#{u.name}", u.id] }
  end

  def measure_id_enum
    Measure.all.map { |u| ["#{u.name}", u.id] }
  end

end
