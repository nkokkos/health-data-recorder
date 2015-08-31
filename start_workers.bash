#!/bin/bash

#kill any remaining process
pkill -f resque
pkill -f rails

#start rails
nohup bundle exec rails s -b 0.0.0.0 -p 3000 -e development > /dev/null &

sleep 3

# start resque queue:
nohup bundle exec rake resque:work QUEUE='*' > /dev/null &

sleep 3

# start resque scheduler:
# see in lib\tasks\resque.rake for more:
nohup bundle exec rake resque:scheduler > /dev/null &

# you can use:
# pkill -f resque
# to kill both processes from the command line
