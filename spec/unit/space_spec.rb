# frozen_string_literal: true

require 'space'

describe Space do
  describe '.create' do
    it 'stores the info in database' do
      title       = 'Summer home'
      description = 'two bed'
      location    = 'UK'
      price       = 56

      described_class.create(
        title: title,
        description: description,
        location: location,
        price: price
      )

      result = DBConnection.exec('SELECT * FROM spaces;')

      expect(result[0]['name']).to eq('Summer home')
    end
  end

  describe '.all' do
    it 'it retrives the enteries from the spaces table' do
      Space.create(
        title: 'Summer home',
        description: 'two bed',
        location: 'UK',
        price: 56
      )

      result = Space.all

      expect(result[0].title).to eq('Summer home')
    end
  end
end
