class ExecuteTriggers

  @queue = :triggers

  def self.perform
    Measurement.build_sql # look in models/measurement.rb for description of build_sql
    #Rails.logger.info "self perform: #{Time.now}"
  end

end
