


require_relative 'bike_container.rb'

class Van

  include BikeContainer

  def collect_broken(station)
    #van goes to station and takes all broken bikes
    station.broken_bikes.each { |bike| bikes << station.release(bike)}
  end

  # this is done in garage class
  # def release_broken_to(garage)
  #   broken_bikes.each do |bike|
  #     release(bike)
  #     garage.dock(bike)
  #   end
  # end
  
  def collect_fixed_bikes(garage)
    garage.available_bikes.each do |bike|
      garage.release(bike)
      self.dock(bike)
    end
  end
  def release_fixed_to(station)
    self.available_bikes.each do |bike|
      release(bike)
      station.dock(bike)
    end
  end
  
end


 
