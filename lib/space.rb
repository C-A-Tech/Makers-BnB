require './lib/db_connection'

class Space 
  def self.create( args = {})
    DBConnection.exec("INSERT INTO spaces (name,description,price) VALUES('#{args[:title]}', '#{args[:description]}', '#{args[:price]}');")
  end
end  