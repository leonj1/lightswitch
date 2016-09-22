# Ruby file

# Script to control Delcom light 40908

require 'rubygems'
require 'blinky'
require 'gmail'
 
puts "Initializing..."
light = Blinky.new.light
light.success!
light.failure!
light.building!
light.warning!
light.off!
 
#plug in your username and password here
puts "Connecting to gmail..."
gmail = Gmail.connect("username", "password")
 
#count the number of unread messages
puts "Getting the total number of unread messages"
prev_unread = gmail.inbox.count(:unread)
 
wait_time = 4
 
#for an infinite amount of time
loop do
  #get the number of unread messages in the inbox
  unread = gmail.inbox.count(:unread)
 
  #lets us know that we've checked the unread messages
  puts "Checked unread:#{unread}"
 
  for i in 0..unread
        puts "Light On"
    light.building!
        sleep 1
        puts "Light Off"
        light.off!
    sleep 1
  end
 
  #wait before we make another request to the Gmail servers
  sleep wait_time
end
