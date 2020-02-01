# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
home_list = [
  ["Crow's Perch", "56 NW Velen"],
  ["Imperial Palace","2501 SE Vizima Drive"]
]
room_list = [
  ["Living Room"],
  ["Garage"],
  ["Kitchen"],
  ["Family Room"],
  ["Dining Room"],
  ["TV Room"],
  ["Music Room"]
]
temp_list = [
  62,
  50,
  70,
  50,
  62,
  61,
  35
]
home_list.each do |name, address|
  @home = Home.create(name: name, address: address)
  room_list.each do |room_name|
    @room = @home.rooms.create(name: room_name, temp_setting: 70)
    temp_list.each do |temp|
      @room.temperatures.create(temperature: temp)
    end
  end
end

puts("Created #{Home.count} homes")
puts("Created #{Home.find(1).rooms.count} rooms per home")
puts("Created #{Room.find(1).temperatures.count} temperature readings per room")
