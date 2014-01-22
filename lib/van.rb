


require_relative 'bike_container.rb'

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end


  def collect_broken(station)
    #van goes to station and takes all broken bikes
    # station.broken_bikes.each { |bike| bikes << station.release(bike)}
    # station.broken_bikes.each do |bike|
    #   raise "Van is full!!" if full?
    #   station.release(bike)
    #   self.dock(bike)
    # end

      i = 0
      while i < station.broken_bikes.length
        
        self.dock(station.broken_bikes[i])
        station.release(station.broken_bikes[i])
        
        raise "Van is full!!" if full? 
        i += 1
      end

      bikes

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


 
