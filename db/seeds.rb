require_relative '../app/models/drivers_model'
require_relative '../app/models/riders_model'

Rider.create(first_name: 'Test1', last_name: 'Git', email: 'rider7@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 28, current_latitude: 4.155140, current_longitude: -73.634339)
Rider.create(first_name: 'Test2', last_name: 'Git', email: 'rider8@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 31, current_latitude: 4.156220,  current_longitude: -73.636839)
Rider.create(first_name: 'Test3', last_name: 'Git', email: 'rider9@rider.com', status: 'ACTIVE', country: 'Colombia', state: 'Meta', city: 'Villavicencio', age: 32, current_latitude: 4.153320, current_longitude: -73.635832 )