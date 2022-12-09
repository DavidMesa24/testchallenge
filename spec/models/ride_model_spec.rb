RSpec.describe Ride, type: :model do
  # Associations tests
  it 'ensure a ride record belongs to a single rider record' do
    is_expected.to belong_to(:rider)
  end
  it 'ensure a ride record belongs to a single driver record' do
    is_expected.to belong_to(:driver)
  end
end