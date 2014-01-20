# Populate the graph with 0.00 results
points = []
(1..10).each do |i|
  points << { x: i, y: 0 }
end
last_x = points.last[:x]

SCHEDULER.every '1m', :first_in => 0 do
  points.shift
  last_x += 1
  uptime = %x('uptime')
  loadavg1min = uptime.split(":")[-1].strip().split(" ")[0]
  points << { x: last_x, y: loadavg1min.to_f }

  send_event('loadavg1min', points: points)
end
