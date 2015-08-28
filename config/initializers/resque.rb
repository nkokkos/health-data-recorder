# This will make the tabs show up.
require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(:host =>  'localhost', :port => 6379 )
Resque.redis.flushall ##flush database after restarting
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
