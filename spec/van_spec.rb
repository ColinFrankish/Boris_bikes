require './lib/van'
require './lib/docking_station'
require './lib/bike'
require './lib/garage'

  describe Van do 
    let (:garage)  { Garage.new }
    let (:van)  { Van.new }
    let (:station)  { DockingStation.new }
    let (:bike)  { Bike.new }
    it "should pick up broken bikes" do
      # 1. if there's a station with one broken bike and an empty van
      
      bike.break
      station.bikes << bike
      # 2. a van should be able to pick it up from the station
      van.collect_broken(station)
      # 3. After a van picks up all broken bikes,
      # the station will have no broken bikes
      # and the van will have one broken bike
      expect(van.bikes.length {|bike| bike.broken? }).to eq(1)
      expect(station.broken_bikes.count).to eq(0)
    end

   # DONE IN GARAGE CLASS/TEST 
   #  it "drop broken bikes at garage" do
     
   #  #van should release broken bikes to garage
   #  bike.break
   #  station.bikes << bike
   #  # 2. a van should be able to pick it up from the station
   #  van.collect_broken(station)
   #  van.release_broken_to(garage)
   #  #garage should have broken bikes
    
   #  expect(van.broken_bikes.count).to eq(0)
   #  expect(garage.broken_bikes.count).to eq(1)
   # end


   #it "should pick up the fixed bikes" do
   #end
  it "should pick up fixed bikes from garage" do
    #van should pick up fixed bikes from the garage
    #bike.break
    garage.dock(bike)
    van.collect_fixed_bikes(garage)
    #garage should have no fixed bikes
    #van should have fixed bikes
    expect(garage.available_bikes.count).to eq(0)
    expect(van.available_bikes.count).to eq(1)
  end
    
  it "should drop fixed bikes to the station" do
      #van should release bikes to station
      #give the van a bike first
      van.dock(bike)
      van.release_fixed_to(station)
      #
      expect(van.available_bikes.count).to eq(0)
      expect(station.available_bikes.count).to eq(1)
  end


    
    













 end