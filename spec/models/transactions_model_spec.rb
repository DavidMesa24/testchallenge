RSpec.describe Transaction, type: :model do
  # Associations tests
  it 'ensure a transaction record belongs to a single rider record' do
    is_expected.to belong_to(:rider)
  end
  it 'ensure a transaction record belongs to a single driver record' do
    is_expected.to belong_to(:driver)
  end
  it 'ensure a transaction record belongs to a single ride record' do
    is_expected.to belong_to(:ride)
  end
end