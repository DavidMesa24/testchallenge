RSpec.describe Rider, type: :model do
  context 'create rider' do
    it 'ensures email presence' do
      is_expected.to validate_presence_of(:email)
    end
    it 'ensures status presence' do
      is_expected.to validate_presence_of(:status)
    end
    # Associations tests
  end
end