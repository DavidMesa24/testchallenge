require_relative '../app/models/drivers_model'
require_relative '../app/models/riders_model'

Rider.create(first_name: 'Camila', last_name: 'Guerrero', email: 'rider4@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 28, current_latitude: 4.155140, current_longitude: -73.634339)
Rider.create(first_name: 'Alejandra', last_name: 'Martínez', email: 'rider5@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 31, current_latitude: 4.156220,  current_longitude: -73.636839)
Rider.create(first_name: 'Carlos', last_name: 'Pineros', email: 'rider6@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 32, current_latitude: 4.153320, current_longitude: -73.635832 )