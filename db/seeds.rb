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

User.create(first_name: 'Joao', last_name: 'Martins', email: 'joao@lewagon.com', password: '123456')
puts '--------- Joao User created successfully -----------'

User.create(first_name: 'Rafael', last_name: 'Quintanilha', email: 'rafael@lewagon.com', password: '123456')
puts '--------- Rafa User created successfully -----------'

User.create(first_name: 'Alexandre', last_name: 'Corte-Real', email: 'alex@lewagon.com', password: '123456')
puts '--------- Alex User created successfully -----------'

User.create(first_name: 'Lochlan', last_name: 'Savage', email: 'lochlan@lewagon.com', password: '123456')
puts '--------- Lochlan User created successfully --------'

tester = User.create(first_name: 'Test', last_name: 'account', email: 'test@lewagon.com', password: '123456')
puts '--------- Testing account created successfully -----'

puts '----------------------------------------------------'
puts '--------- All Users created successfully -----------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '---------------- Creating some Vehicles ------------'
puts '------------------ Please wait ... -----------------'

Vehicle.create(type_of_vehicle: 'Motorcycle',
               make: 'Suzuki',
               model: 'GSXR-600',
               plate: '73-TR-11',
               year: 2022,
               mileage: 100,
               driver: 'Tester',
               user_id: tester.id)

puts '----------------------------------------------------'
puts '--------- All Vehicles created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '----------- Creating some Maintenances -------------'
puts '------------------ Please wait ... -----------------'

@vehicle = Vehicle.last
maintenance = Maintenance.new(title: 'Pay IUC',
                              description: 'Pay circulation tax',
                              repeat: true,
                              priority: 'High',
                              price: 150,
                              status: false)
maintenance.vehicle_id = @vehicle.id
maintenance.save

maintenance = Maintenance.new(title: 'Pay Insurance',
                              description: 'Pay Insurance',
                              repeat: true, priority: 'High',
                              price: 300,
                              status: false)
maintenance.vehicle_id = @vehicle.id
maintenance.save

maintenance = Maintenance.new(title: 'Take car for inspection',
                              description: 'Take car for inspection',
                              repeat: true,
                              priority: 'High',
                              price: 35,
                              status: false)
maintenance.vehicle_id = @vehicle.id
maintenance.save

puts '----------------------------------------------------'
puts '----- All Maintenances created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '------------- Creating some Problems ---------------'
puts '------------------ Please wait ... -----------------'

problem = Problem.new(title: 'Engine Noise',
                      description: 'Ticking Noise in Engine',
                      priority: 'High',
                      price: 150,
                      status: false)

problem.vehicle_id = @vehicle.id
problem.save

puts '----------------------------------------------------'
puts '--------- All Problems created successfully --------'
puts '----------------------------------------------------'

puts '----------------------------------------------------'
puts '---------- Creating some Wishlist Items ------------'
puts '------------------ Please wait ... -----------------'

item = Wishlist.new(name: 'New Exhaust',
                    url: 'https://www.amazon.es/-/pt/dp/B07DX4R3ZX/ref=sr_1_12?crid=ASW4H408BX62&keywords=exhaust&qid=1662467397&sprefix=exhaust%2Caps%2C108&sr=8-12',
                    status: false,
                    price: 627.53)
item.vehicle_id = @vehicle.id
item.save

puts '----------------------------------------------------'
puts '--------- All Items created successfully -----------'
puts '----------------------------------------------------'

puts '****************************************************'
puts '------------------ DB now Seeded -------------------'
puts '****************************************************'
