require './lib/docking_station'
describe DockingStation do

let(:station) {DockingStation.new(:capacity => 123)} 
let(:bike) {Bike.new}
 
  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should check if station is empty" do
    expect(station).to be_empty
    station.dock(bike)
    expect(station).not_to be_empty
  end

end