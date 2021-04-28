require './lib/db_connection'

class Space
  attr_reader :title, :description, :price, :location, :id
  def initialize(args = {})
    @title = args[:title]
    @location = args[:location]
    @description = args[:description]
    @price = args[:price]
    @id = args[:id]
  end

  def self.create( args = {})
    DBConnection.exec("INSERT INTO spaces (name,description,price) VALUES('#{args[:title]}', '#{args[:description]}', '#{args[:price]}');")
  end

  def self.all
    result = DBConnection.exec("SELECT * FROM spaces;")
    
    result.map { |space| Space.new(title: space['name'], description: space['description'], price: space['price'], id: space['id']) }
  end
end  
