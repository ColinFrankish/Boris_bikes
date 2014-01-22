require_relative '../lib/garage'

describe Garage do
  let (:garage) {Garage.new}
  let (:van) {Van.new}
  let (:bike) {Bike.new}
  it "should receive a broken bike from the van" do
      bike.break
      van.dock(bike)
      garage.old_collect_broken_bikes(van)
      expect(van.broken_bikes.count).to eq(0)
      expect(garage.broken_bikes.count).to eq(1)
  end
  

  it "has to fix a broken bike" do
    bike.break
    van.dock(bike)
    garage.collect_broken_bikes(van)
    expect(garage.broken_bikes.count).to eq(0)
    expect(garage.available_bikes.count).to eq(1)
  end



end