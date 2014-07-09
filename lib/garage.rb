

class Garage

  include BikeContainer

  def collect_broken_bikes(van)
    van.broken_bikes.each do |bike|
    van.release(bike)
      self.dock(bike)
    end
  end

  alias_method :old_collect_broken_bikes, :collect_broken_bikes

  def collect_broken_bikes(van)
    van.broken_bikes.each do |bike|
    van.release(bike)
      self.dock(bike)
      bike.fix
    end
  end


  # previous code used to fix the bikes, now done in one method so that
  # the bikes are fixed as soon as they enter the garage. 
  # def fix_the_bike(broken_bikes)
  #   self.broken_bikes.each do |bike|
  #     bike.fix
  #   end
  # end

end