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

    assert_equal 60, dock.calculate_revenue(dock, kayak)
  end

  def test_that_when_a_dock_begins_tracking_rent
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    assert_equal 1, dock.rent(canoe, patrick)
  end
end
