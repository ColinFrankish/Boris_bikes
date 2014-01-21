require './lib/van'
require './lib/docking_station'
require './lib/bike'


  describe Van do 
    it "should pick up broken bikes" do
      # 1. if there's a station with one broken bike and an empty van
      station = DockingStation.new
      broken_bike = Bike.new
      broken_bike.break
      station.bikes << broken_bike
      van = Van.new
      # 2. a van should be able to pick it up from the station
      van.collect_broken(station)
      # 3. After a van picks up all broken bikes,
      # the station will have no broken bikes
      # and the van will have one broken bike
      expect(van.bikes.length {|bike| bike.broken? }).to eq(1)
      expect(station.broken_bikes.count).to eq(0)
    end

 end