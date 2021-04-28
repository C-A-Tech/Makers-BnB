# frozen_string_literal: true

require 'pg'
module DBConnection
  def self.exec(sql_query)
    connection = PG.connect(dbname: "airbnb_#{ENV['RACK_ENV']}")
    connection.exec(sql_query)
  rescue PG::Error => e
    puts e.message
  ensure
    connection&.close
  end
end
