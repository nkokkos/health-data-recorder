class Setting < ActiveRecord::Base
  #setting table is used to store user preference on whether
  #the user wants to expose data to doctor/personell. Also, the
  #settings table exposes ability for the user to choose which
  #device should be used to BMI/Fat % calculation
  
  belongs_to :user
end
