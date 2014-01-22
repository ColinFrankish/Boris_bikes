require './lib/van'
require './lib/docking_station'
require './lib/bike'
require './lib/garage'

describe Garage do
  let (:garage) {Garage.new}
  let (:van) {Van.new}
  let (:bike) {Bike.new}
  it "should receive a broken bike from the van" do
      #van needs to release the bike
      bike.break
      van.dock(bike)
      #van.release(garage)
      garage.collect_broken_bikes(van)

      expect(van.broken_bikes.count).to eq(0)
      expect(garage.broken_bikes.count).to eq(1)  #
  end
  it "has to fix a broken bike" do
    bike.break
    garage.dock(bike)
    expect(garage.broken_bikes.count).to eq(1)
    garage.fix_the_bike(garage.broken_bikes)

    expect(garage.broken_bikes.count).to eq(0)
  end



end