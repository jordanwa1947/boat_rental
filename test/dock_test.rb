require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'

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

    assert_equal 60, dock.calculate_revenue
  end

  def test_that_the_boat_can_only_be_charged_for_max_rental_time
    dock = Dock.new("The Rowing Dock", 5)

    assert_equal 60, dock.calculate_revenue
  end
end
