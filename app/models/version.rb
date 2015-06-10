class Version < ActiveRecord::Base

  #class method to set the version of the web application
  def self.set_version=(version)
    ver = Version.all.first
    ver.version = version
    ver.save
  end

end
