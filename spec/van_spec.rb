require './lib/van'
require './lib/docking_station'
require './lib/bike'
require './lib/garage'

  describe Van do 
    let (:garage)  { Garage.new }
    let (:van)  { Van.new }
    let (:station)  { DockingStation.new }
    let (:broken_bike)  { Bike.new }
    it "should pick up broken bikes" do
      # 1. if there's a station with one broken bike and an empty van
      
      broken_bike.break
      station.bikes << broken_bike
      # 2. a van should be able to pick it up from the station
      van.collect_broken(station)
      # 3. After a van picks up all broken bikes,
      # the station will have no broken bikes
      # and the van will have one broken bike
      expect(van.bikes.length {|bike| bike.broken? }).to eq(1)
      expect(station.broken_bikes.count).to eq(0)
    end
    it "drop broken bikes at garage" do
     
     #van should release broken bikes to garage
     broken_bike.break
     
     van.release_broken(broken_bikes)
     
     #garage should have broken bikes
     #van should have fixed bikes 
     expect(van.broken_bikes.count).to eq(0)
     expect(garage.broken_bikes.count).to eq(1)
   end
   #it "should pick up the fixed bikes" do
   #end
 end