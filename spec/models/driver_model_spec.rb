# frozen_string_literal: true
RSpec.describe Driver, type: :model do
  context 'create driver' do
    it 'ensures email presence' do
      is_expected.to validate_presence_of(:email)
    end

    it 'ensures firt_name presence' do
      is_expected.to validate_presence_of(:first_name)
    end

  end
end