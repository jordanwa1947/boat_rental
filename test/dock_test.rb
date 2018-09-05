require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test

  def test_it_exits
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_that_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_that_dock_can_calculate_revenue
    dock = Dock.new("The Rowing Dock", 3)
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour

    assert_equal 40, dock.calculate_revenue(dock, kayak)
  end

  def test_that_the_boat_can_only_be_charged_for_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour

    assert_equal 60, dock.revenue
  end

  def test_that_log_hour_adds_one_hour_for_every_boat_rented
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)
  end
end
