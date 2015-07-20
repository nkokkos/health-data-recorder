class ExecuteTriggers
  @queue = :triggers

  def self.perform
    Measurement.build_sql(1)
  end
  
end
