
require_relative 'bike_container.rb'

class Van

  include BikeContainer

  def collect_broken(station)
    #van goes to station and takes all broken bikes
    station.broken_bikes.each { |bike| bikes << station.release(bike)}
  end

  


  
end


 
