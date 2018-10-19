for i in 1..60
  puts "Data + #{i}"
  #measurement_block = MeasurementBlock.create(:user_id => 2)
  for x in 1..60
    Measurement.create(:measure_value => Random.new.rand(40..130),
				       :measurement_block_id => measurement_block.id,
					   :measure_id => 28,
					   :device_id  => 26,
				       #:created_at => Time.at(60.days.ago + rand * (Time.now.to_f - 60.days.ago.to_f)))
					   :created_at => Time.at(60.days.ago + x.days)

   end
end
