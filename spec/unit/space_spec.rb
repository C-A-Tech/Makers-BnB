require 'space'

describe Space do
  describe '.create' do
    it 'stores the info in database' do
      title = 'Summer home'
      description = 'two bed'
      location = 'UK'
      price = 56

      described_class.create(title: title, description: description, location: location, price: price)
      result = DBConnection.exec("SELECT * FROM spaces;")
      p result.first
      expect(result[0]['name']).to eq('Summer home')
    end
  end
end