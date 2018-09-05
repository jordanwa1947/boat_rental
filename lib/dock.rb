
class Dock
  attr_reader :name, :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
  end

  def calculate_revenue(dock_object, boat_object)
    if dock_object.max_rental_time > boat_object.hours_rented
      boat_object.price_per_hour * boat_object.hours_rented
    else
      boat_object.price_per_hour * dock_object.max_rental_time
    end
  end

  def rent

  end

end
