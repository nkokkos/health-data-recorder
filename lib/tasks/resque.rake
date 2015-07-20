require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  
  task :setup do
    require 'resque'
    #require 'resque-scheduler'
  end
  
  task :setup_schedule => :setup do
    require 'resque-scheduler'
	Resque.schedule = {}
	#require 'jobs'
  end
  
  task :scheduler => :setup_schedule
end


