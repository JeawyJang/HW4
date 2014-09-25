#Maneerat W. 5631309021
#Thunyatorn V. 5631258721

require 'sinatra'
require 'geocoder'
require 'timezone'
 
get '/' do
  erb :form
end
 
Timezone::Configure.begin do |c| 
  c.username = 'jeawyjang' 
  
end
post '/form' do
  city = params[:message]
  latlong = Geocoder.coordinates(city.capitalize)
  timezone = Timezone::Zone.new(:latlon => latlong)
 

  t = timezone.time Time.now
  t2 = t.to_s.split(' ')
  time = t2[1].split(':')
  h = time[0].to_i
  m = time[1]
  if(h>12) 
    h = h - 12
    clock = "PM"
  else 
    clock = "AM"

  
  end
  "<center> The current time in #{city} is <br><br> <br><br><h1> #{h}:#{m}#{clock}  </h1><center/>"
 
end