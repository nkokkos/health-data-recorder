# == Schema Information
#
# Table name: versions
#
#  id         :integer          not null, primary key
#  version    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Version < ActiveRecord::Base

  #class method to set the version of the web application
  def self.set_version=(version)
    ver = Version.all.first
    ver.version = version
    ver.save
  end

end
