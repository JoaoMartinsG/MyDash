puts '----------------------------------------------------'
puts '--------------- Deleting all records ---------------'
puts '------------------ Please wait ... -----------------'
puts '----------------------------------------------------'

Maintenance.destroy_all
puts '------------ All Maintenances deleted --------------'

Problem.destroy_all
puts '------------ All Problems deleted ------------------'

Wishlist.destroy_all
puts '------------ All Wishlists deleted -----------------'

Vehicle.destroy_all
puts '------------ All Vehicles deleted ------------------'

User.destroy_all
puts '------------ All Users deleted ---------------------'

puts '----------------------------------------------------'
puts '---------- Records deleted successfully ------------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '-------------- Creating our Users ------------------'
puts '------------------ Please wait ... -----------------'

joao = User.create(first_name: 'Joao', last_name: 'Martins', email: 'joao@lewagon.com', password: 'password')
puts '--------- Joao User created successfully -----------'

rafa = User.create(first_name: 'Rafael', last_name: 'Quintanilha', email: 'rafael@lewagon.com', password: 'password')
puts '--------- Rafa User created successfully -----------'

alex = User.create(first_name: 'Alexandre', last_name: 'Corte-Real', email: 'alex@lewagon.com', password: 'password')
puts '--------- Alex User created successfully -----------'

loch = User.create(first_name: 'Lochlan', last_name: 'Savage', email: 'lochlan@lewagon.com', password: 'password')
puts '--------- Lochlan User created successfully --------'

puts '----------------------------------------------------'
puts '--------- All Users created successfully -----------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '---------------- Creating some Vehicles ------------'
puts '------------------ Please wait ... -----------------'

Vehicle.create(type_of_vehicle: 'Car', make: 'BMW', model: 'M5', plate: '73-TR-11', year: 2020, mileage: 3000, driver: 'Alex', user_id: rafa.id)
Vehicle.create(type_of_vehicle: 'Motorcycle', make: 'Yamaha', model: 'R1', plate: '69-BB-69', year: 2022, mileage: 1500, driver: 'Joao', user_id: joao.id)
Vehicle.create(type_of_vehicle: 'Car', make: 'Ferrari', model: 'SF90', plate: '54-HS-87', year: 2020, mileage: 10, driver: 'Lochlan', user_id: alex.id)
Vehicle.create(type_of_vehicle: 'Car', make: 'Mercedes-Benz', model: 'A180', plate: '92-RT-74', year: 2005, mileage: 100_000, driver: 'Joao', user_id: loch.id)
Vehicle.create(type_of_vehicle: 'Car', make: 'Lamborghini', model: 'Huracan', plate: '12-JT-45', year: 2012, mileage: 30_000, driver: 'Rafa', user_id: joao.id)

puts '----------------------------------------------------'
puts '--------- All Vehicles created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '----------- Creating some Maintenances -------------'
puts '------------------ Please wait ... -----------------'

@vehicles = Vehicle.all
@vehicles.each do |vehicle|
  maintenance = Maintenance.new(title: 'Pay IUC', description: 'Pay circulation tax', recorrency: 1, priority: 'High', price: 150, status: 0)
  maintenance.vehicle_id = vehicle.id
  maintenance.save
  maintenance = Maintenance.new(title: 'Pay Insurance', description: 'Pay Insurance', recorrency: 1, priority: 'High', price: 300, status: 0)
  maintenance.vehicle_id = vehicle.id
  maintenance.save
  maintenance = Maintenance.new(title: 'Take car for inspection', description: 'Take car for inspection', recorrency: 2, priority: 'High', price: 35, status: 0)
  maintenance.vehicle_id = vehicle.id
  maintenance.save
end

puts '----------------------------------------------------'
puts '----- All Maintenances created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '------------- Creating some Problems ---------------'
puts '------------------ Please wait ... -----------------'

@vehicles.each do |vehicle|
  problem = Problem.new(title: 'Engine Noise', description: 'Ticking Noise in Engine Bay', priority: 'High', price: 150, status: 0)
  problem.vehicle_id = vehicle.id
  problem.save
end

puts '----------------------------------------------------'
puts '--------- All Problems created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '---------- Creating some Wishlist Items ------------'
puts '------------------ Please wait ... -----------------'

@vehicles.each do |vehicle|
  item = Wishlist.new(name: 'New Exhaust', url: 'testurl.com', status: 0)
  item.vehicle_id = vehicle.id
  item.save
end

puts '----------------------------------------------------'
puts '--------- All Items created successfully -----------'
puts '----------------------------------------------------'

puts '****************************************************'
puts '------------------ DB now Seeded -------------------'
puts '****************************************************'
