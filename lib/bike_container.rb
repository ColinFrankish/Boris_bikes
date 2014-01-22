
module BikeContainer

    DEFAULT_CAPACITY = 10

    def bikes
      @bikes ||= []
    end

    def capacity
      @capacity ||= DEFAULT_CAPACITY
    end
    def capacity=(value)
      @capacity = value
    end
    def bike_count
      bikes.count
    end
    def dock(bike)
      raise "You can fit no more bikes in" if full?
      raise "You can only dock bikes!!" unless bike.is_a?(Bike)
      bikes << bike
    end
    def release(bike)
      if bikes.empty? 
        raise  "There are no bikes to release" 
      end
      bikes.delete(bike)
    end
    def full?
      bike_count == capacity
    end
    def available_bikes
      bikes.reject { |bike| bike.broken? }
    end

    def broken_bikes
     bikes.select { |bike| bike.broken? }
    end
  end