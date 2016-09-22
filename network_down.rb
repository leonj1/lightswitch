require 'rubygems'
require 'blinky'

# alert when network down
 
light = Blinky.new.light
 
begin 
    ping_count = 10
    server = "www.google.com"
    result = `ping -q -c #{ping_count} #{server}`
    if $?.exitstatus != 0
      light.failure!
      puts "Device is down!"
      cmd = `osascript -e 'display notification "Restarting" with title "Wifi"'`
      exit
    end
 
    light.success!
rescue
    light.warning!
end
