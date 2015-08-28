class ExecuteTriggers

  @queue = :triggers

  def self.perform
    Measurement.build_sql
    Rails.logger.info "self perform: #{Time.now}"
  end

end
