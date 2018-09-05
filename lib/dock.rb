
class Dock
  attr_reader :name, :max_rental_time, :revenue
  attr_accessor :rented
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rented = []
  end

  def rent(boat, renter)
    @rented << boat
  end

  def log_hour
    @rented.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    if @max_rental_time > boat.hours_rented
      @revenue = boat.price_per_hour * boat.hours_rented
    else
      @revenue = boat.price_per_hour * @max_rental_time
    end
    boat.hours_rented = 0
  end
end
