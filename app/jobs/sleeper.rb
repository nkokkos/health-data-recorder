#simple test class to check Resque
class Sleeper
  @queue = :sleep

  def self.perform(seconds)
    sleep(seconds)
  end

end
