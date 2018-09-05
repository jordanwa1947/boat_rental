require './lib/boat'

class Dock
  attr_reader :name, :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
  end

  def calculate_revenue(boat_type)
    boat_type.price_per_hour
    
  end

end
