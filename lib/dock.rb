
class Dock
  attr_reader :name, :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
  end

  def revenue
    if @max_rental_time > boat.hours_rented
      boat_object.price_per_hour * boat_object.hours_rented
    else
      boat_object.price_per_hour * @max_rental_time
    end
  end

  def rent(boat, renter)

  end

  def log_hour
    boat.hours_rented + 1
  end

  def return

  end
end
